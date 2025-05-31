{
  description = "Purescript Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    purescript-overlay = {
      url = "github:thomashoneyman/purescript-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      nixpkgsFor = forAllSystems (
        system:
        import nixpkgs {
          inherit system;
          config = { };
          overlays = builtins.attrValues self.overlays;
        }
      );
    in
    {
      overlays = {
        purescript = inputs.purescript-overlay.overlays.default;
      };
      devShells = forAllSystems (
        system:
        # pkgs now has access to the standard PureScript toolchain
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          default = pkgs.mkShell {
            name = "my-purescript-project";
            buildInputs = with pkgs; [
              purs
              spago
              purs-tidy-bin.purs-tidy-0_10_0
              treefmt
              dhall
            ];
          };
        }
      );
    };
}
