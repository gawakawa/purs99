{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    purs-nix.url = "github:purs-nix/purs-nix";
    flake-parts.url = "github:hercules-ci/flake-parts";
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
          pkgs = import inputs.nixpkgs { inherit system; };

          purs-nix = inputs.purs-nix { inherit system; };

          ps-tools = inputs.purs-nix.inputs.ps-tools.legacyPackages.${system};

          ps = purs-nix.purs {
            dependencies = [
              "arrays"
              "console"
              "effect"
              "maybe"
              "prelude"
            ];

            test-dependencies = [
              "test-unit"
            ];

            dir = ./.;
          };
        in
        {
          packages = with ps; {
            default = app { name = "purs99"; };
            bundle = bundle { };
            output = output { };
          };

          apps.default = {
            type = "app";
            program = "${config.packages.default}/bin/purs99";
          };

          devShells.default = pkgs.mkShell {
            buildInputs = [
              pkgs.nodejs
              (ps.command { })
              purs-nix.esbuild
              purs-nix.purescript
              ps-tools.for-0_15.purescript-language-server
            ];
          };

          treefmt = {
            programs = {
              nixfmt.enable = true;
              purs-tidy.enable = true;
            };
          };
        };
    };
}
