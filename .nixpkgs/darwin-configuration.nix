{ config, pkgs, ... }:

{
  environment.systemPackages =
    (with pkgs; [
      emacsMacport
      # editor deps
      aspell
      ripgrep
      git
      fd
      shellcheck

      adoptopenjdk-hotspot-bin-8
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
