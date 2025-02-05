{
  description = "dcarley system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    flox.url = "github:flox/flox/v1.3.12";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, flox }: {
    darwinConfigurations.mbp13 = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./nix/darwin.nix
        {
          nixpkgs.hostPlatform = "x86_64-darwin";
        }
      ];
    };
    darwinConfigurations.mbp16 = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./nix/darwin.nix
        {
          nixpkgs.hostPlatform = "aarch64-darwin";
        }
      ];
    };
    darwinConfigurations.mba15 = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./nix/darwin.nix
        {
          nixpkgs.hostPlatform = "aarch64-darwin";
        }
      ];
    };
  };
}
