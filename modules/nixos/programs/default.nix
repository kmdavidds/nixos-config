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
    blueberry
    xsettingsd
    xorg.xrdb
    hyprshot
    brightnessctl
    wlogout
    wl-clipboard
    clipse
    hypridle
    nix-prefetch-github
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
