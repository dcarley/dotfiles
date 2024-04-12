{
  description = "Go template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.11-darwin";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShell = with pkgs; mkShell {
          buildInputs = [
            go
            go-task
            gotools
            gopls
            gocode
            gomodifytags
            gotests
            gore
          ];
        };
      });
}
