{ config, pkgs, ... }:

let
  # https://status.nixos.org/
  # channel:nixos-22.05
  stable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/178fea1414ae708a5704490f4c49ec3320be9815.tar.gz") {};
  # channel:nixos-unstable
  unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/a63021a330d8d33d862a8e29924b42d73037dd37.tar.gz") {};
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

      jdk11
      ( callPackage ./leiningen.nix { jdk = jdk11; } )
      babashka
      # editor deps
      clojure-lsp
      clj-kondo

      go_1_18
      ginkgo
      # editor deps
      gopls
      gocode
      gomodifytags
      gotests
      gore

      unstable.httpie
      jq
      yq-go
      vegeta

      unstable.kitty
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
