{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    purescript-overlay = {
      url = "github:thomashoneyman/purescript-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      imports = [ inputs.treefmt-nix.flakeModule ];

      perSystem =
        {
          config,
          pkgs,
          system,
          ...
        }:
        let
          pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [ inputs.purescript-overlay.overlays.default ];
          };
          ciPackages = with pkgs; [
            purs
            spago-unstable
            purs-tidy
            nodejs_22
          ];
          devPackages =
            ciPackages
            ++ (with pkgs; [
              purs-backend-es
              purescript-language-server
              esbuild
            ]);
        in
        {
          devShells.default = pkgs.mkShell {
            buildInputs = devPackages;
          };
          packages.ci = pkgs.buildEnv {
            name = "ci";
            paths = ciPackages;
          };
          treefmt = {
            programs.nixfmt.enable = true;
            programs.purs-tidy.enable = true;
          };
        };
    };
}
