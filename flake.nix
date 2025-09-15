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
        devPackages = with pkgs; [
          purs
          spago-unstable
          purs-tidy
          purs-backend-es
          purescript-language-server
          nodejs_22
          esbuild
        ];
        ciPackages = with pkgs; [
          purs
          spago-unstable
          purs-tidy
          nodejs_22
        ];
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
