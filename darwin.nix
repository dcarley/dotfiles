{ pkgs, inputs, ... }:
let
  floxBin = "${inputs.flox.packages.${pkgs.system}.default}/bin/flox";
  floxApps = [
    { name = "Emacs"; command = "${floxBin} activate -m run -d ~/dotfiles/flox/emacs -- emacs"; }
    { name = "Kitty"; command = "${floxBin} activate -m run -d ~/dotfiles/flox/term -- kitty"; }
  ];

  # Generates a script to create a .app for a flox package
  mkFloxAppScript = app: ''
    mkdir -p "/Applications/Flox Trampolines"
    osacompile \
      -o "/Applications/Flox Trampolines/${app.name}.app" \
      -e 'do shell script "zsh -l -c \"${app.command}\""'
  '';

  postActivationScript = pkgs.lib.concatStringsSep "\n" (map mkFloxAppScript floxApps);
in
{
  environment.systemPackages =
    [
      # Installed manually:
      # Chrome
      # 1password
      # Docker for Mac
      # Zoom
      # Spotify

      inputs.flox.packages.${pkgs.system}.default
    ];

  system.activationScripts.postActivation.text = postActivationScript;

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
  nix.settings = {
    experimental-features = "nix-command flakes";
    # https://flox.dev/docs/install-flox/#__tabbed_1_5
    substituters = [
      "https://cache.flox.dev"
    ];
    trusted-public-keys = [
      "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs="
    ];
    trusted-users = [
      "@admin"
    ];
  };

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.rev or inputs.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
