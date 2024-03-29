{ pkgs, inputs, ... }: {
  environment.systemPackages =
    (with pkgs; [
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
      go-task
      # editor deps
      gotools
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

  environment.variables = {
    ASPELL_CONF = "dict-dir ${pkgs.aspellDicts.en}/lib/aspell";
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  programs.gnupg.agent.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

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

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.rev or inputs.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
