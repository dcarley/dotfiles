{ config, pkgs, ... }:

let
  # https://status.nixos.org/
  # channel:nixos-22.05
  stable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/cc634d9aa08ed89c9ff655de06ab2e593c72ebc1.tar.gz") {};
  # channel:nixos-unstable
  unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/a63021a330d8d33d862a8e29924b42d73037dd37.tar.gz") {};
in {
  environment.systemPackages =
    (with stable; [
      emacs
      # editor deps
      aspell
      ripgrep
      git
      fd
      shellcheck

      jdk11
      leiningen
      babashka
      # editor deps
      clojure-lsp
      clj-kondo

      go
      # editor deps
      gopls
      gocode
      gomodifytags
      gotests
      gore

      httpie
      jq

      tmux
      coreutils
      vim

      pass
      gnupg
    ]);

  environment.variables = {
    JAVA_HOME = "/run/current-system/sw";
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  programs.gnupg.agent.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
