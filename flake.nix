{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    purescript-overlay = {
      url = "github:thomashoneyman/purescript-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      purescript-overlay,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ purescript-overlay.overlays.default ];
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
      }
    );
}
