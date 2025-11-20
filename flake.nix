{
  description = "dcarley system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    flox.url = "github:flox/flox/latest";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, flox }:
    let
      makeSystem = platform: nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./darwin.nix
          { nixpkgs.hostPlatform = platform; }
        ];
      };
      systems = {
        mbp13 = "x86_64-darwin";
        mbp16 = "aarch64-darwin";
        mba15 = "aarch64-darwin";
      };
    in
    {
      darwinConfigurations = nixpkgs.lib.mapAttrs (hostname: platform: makeSystem platform) systems;
    };
}
