{
  description = "Purescript Flake";

  inputs = {
    flake-compat.flake = false;
    flake-compat.url = "github:edolstra/flake-compat";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    easy-purescript-nix = {
      url = "github:justinwoo/easy-purescript-nix";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, flake-compat, easy-purescript-nix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        eps = import easy-purescript-nix { inherit pkgs; };
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            dhall
            nixfmt
            # nodejs-19_x
            purescript
            eps.purs-tidy
            eps.spago
            treefmt
          ];
        };
      });
}

