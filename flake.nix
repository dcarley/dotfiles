{
  description = "dcarley system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    flox.url = "github:flox/flox/latest";
  };

  outputs = inputs@{ nixpkgs, nix-darwin, ... }:
    let
      makeSystem = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };
        modules = [ ./darwin.nix ];
      };
      hostnames = [ "mbp16" "mba15" ];
    in
    {
      darwinConfigurations = nixpkgs.lib.genAttrs hostnames (_: makeSystem);
    };
}
