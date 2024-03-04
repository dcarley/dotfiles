{ config, pkgs, ... }:

let
  # https://status.nixos.org/
  # channel:nixos-23.11
  stable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-23.11.tar.gz") {};
  # channel:nixos-unstable
  unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/1536926ef5621b09bba54035ae2bb6d806d72ac8.tar.gz") {};
in {
  environment.systemPackages =
    (with stable; [
      # Installed manually:
      # Chrome
      # 1password
      # Docker for Mac
      # Zoom
      # Spotify

      emacs
      # editor deps
      aspell
      ripgrep
      git
      fd
      shellcheck

      go
      ginkgo
      # editor deps
      gopls
      gocode
      gomodifytags
      gotests
      gore

      httpie
      jq
      yq-go
      vegeta

      kitty
      fzf
      coreutils
      vim

      pass
      gnupg

      minikube
      kubectl
      kubernetes-helm
      stern

      aws-iam-authenticator
      awscli2
    ]);

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  programs.gnupg.agent.enable = true;

  system.patches = [
    ./sudo.patch
  ];

  system.defaults.dock = {
    autohide = true;
    tilesize = 64;
    static-only = true;
    mru-spaces = false;
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  system.defaults.trackpad = {
    Clicking = true;
    TrackpadThreeFingerDrag = true;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
