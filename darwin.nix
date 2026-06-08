{ pkgs, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
  floxPkg = inputs.flox.packages.${system}.default;
  floxBin = "${floxPkg}/bin/flox";
  floxApps = [
    { name = "Emacs"; command = "${floxBin} activate -r dcarley/emacs -- emacs"; }
    { name = "Kitty"; command = "${floxBin} activate -r dcarley/term -- kitty"; }
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

      pkgs.aerospace
      floxPkg
    ];

  system.activationScripts.postActivation.text = postActivationScript;

  environment.variables = {
    ASPELL_CONF = "dict-dir ${pkgs.aspellDicts.en}/lib/aspell";
  };

  system.primaryUser = "dcarley";

  # Create shell config that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina and later

  programs.gnupg.agent.enable = true;

  security.pam.services.sudo_local.touchIdAuth = true;

  services.aerospace.enable = true;

  # services.aerospace always passes --config-path to a nix-store rendered TOML
  # built from the module's option defaults, which has an empty [mode.main.binding]
  # and overrides ~/.aerospace.toml. Strip the flag so Aerospace falls back to
  # ~/.aerospace.toml (or its built-in defaults if absent).
  launchd.user.agents.aerospace.serviceConfig.ProgramArguments = pkgs.lib.mkForce [
    "/bin/sh"
    "-c"
    "/bin/wait4path /nix/store && exec ${pkgs.aerospace}/Applications/AeroSpace.app/Contents/MacOS/AeroSpace"
  ];

  system.defaults.dock = {
    autohide = true;
    tilesize = 64;
    static-only = true;
    mru-spaces = false;
    expose-group-apps = true;
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  system.defaults.trackpad = {
    Clicking = true;
    TrackpadThreeFingerDrag = true;
  };

  # Disable things that interfere with aerospace.
  system.defaults.spaces.spans-displays = true;
  system.defaults.NSGlobalDomain.NSAutomaticWindowAnimationsEnabled = false;
  system.defaults.NSGlobalDomain.NSWindowShouldDragOnGesture = true;
  system.defaults.WindowManager = {
    GloballyEnabled = false;
    AutoHide = false;
  };
  system.defaults.CustomUserPreferences = {
    "com.apple.WindowManager" = {
      EnableTilingByEdgeDrag = false;
      EnableTopTilingByEdgeDrag = false;
      EnableTilingOptionAccelerator = false;
      EnableTiledWindowMargins = false;
      EnableStandardClickToShowDesktop = false;
    };
    #
    "com.apple.symbolichotkeys" = {
      AppleSymbolicHotKeys = {
        # Ctrl[-Opt]-Arrow
        "79"  = { enabled = false; };
        "80"  = { enabled = false; };
        "81"  = { enabled = false; };
        "82"  = { enabled = false; };
        # Ctrl-N
        "118" = { enabled = false; };
        "119" = { enabled = false; };
        "120" = { enabled = false; };
        "121" = { enabled = false; };
        "122" = { enabled = false; };
        "123" = { enabled = false; };
        "124" = { enabled = false; };
        "125" = { enabled = false; };
        "126" = { enabled = false; };
        "127" = { enabled = false; };
      };
    };
  };

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.flake = {
   setFlakeRegistry = false;
   setNixPath = false;
  };
  nix.enable = true;
  nix.settings = {
    experimental-features = "nix-command flakes";
    # https://flox.dev/docs/install-flox/#__tabbed_1_5
    substituters = [
      "https://cache.flox.dev"
    ];
    trusted-public-keys = [
      "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs="
    ];
  };

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.rev or inputs.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
