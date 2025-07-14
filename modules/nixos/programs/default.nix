{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    fastfetch
    nixd
    vscode
    nixfmt-rfc-style
    micro
    cloudflare-warp
    inputs.zen-browser.packages.x86_64-linux.default
    discord
    tlrc
    (import ../../../pkgs/first-pkg { inherit pkgs; })
    (import ../../../pkgs/mkdir-nix { inherit pkgs; })
    obs-studio
    zoom-us
    libreoffice-still
    hunspell
    hunspellDicts.en_US-large
    bruno
    bruno-cli
    dbgate
    cloudflared
    ansible
    gnomeExtensions.spotify-controls
    gnomeExtensions.system-monitor
    gnomeExtensions.auto-move-windows
    auto-cpufreq
    laravel
    aseprite
    postman
    rofi-wayland
    waybar
    dunst
    libnotify
    networkmanagerapplet
    swww
    font-awesome
    hyprlock
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    withUWSM = true; # recommended for most users
    xwayland.enable = true; # Xwayland can be disabled.
  };
  programs.waybar.enable = true;
  programs.hyprlock.enable = true;
  programs.hyprlock.settings = {
    general = {
      disable_loading_bar = true;
      grace = 300;
      hide_cursor = true;
      no_fade_in = false;
    };

    background = [
      {
        path = "/home/kmdavidds/Pictures/eveningsky.png";
        blur_passes = 3;
        blur_size = 8;
      }
    ];

    input-field = [
      {
        size = "200, 50";
        position = "0, -80";
        monitor = "";
        dots_center = true;
        fade_on_empty = false;
        font_color = "rgb(202, 211, 245)";
        inner_color = "rgb(91, 96, 120)";
        outer_color = "rgb(24, 25, 38)";
        outline_thickness = 5;
        shadow_passes = 2;
      }
    ];
  };

  programs.zsh.enable = true;
  programs.dconf.enable = true;

  # Install firefox.
  programs.firefox.enable = true;
  # Use Appimage
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}
