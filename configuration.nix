# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Use stylix
  stylix = {
    enable = true;
    image = pkgs.fetchurl {
      url = "https://images.pexels.com/photos/189349/pexels-photo-189349.jpeg";
      sha256 = "JJXzoL+tOPabpZQgmVm06LIPmW5IGbBL+6oijAuKx1c=";
    };
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";
    fonts = {
      monospace = {
        package = pkgs.fira-code;
        name = "Fira Code";
      };
    };
    cursor = {
      package = pkgs.banana-cursor;
      name = "Banana";
    };
    opacity = {
      applications = 0.75;
      terminal = 0.75;
      desktop = 0.75;
      popups = 0.75;
    };
  };

  virtualisation.docker = {
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  programs.zsh.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kmdavidds = {
    isNormalUser = true;
    description = "Komang David Dananjaya Suartana";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    # packages = with pkgs; [
    #   #  thunderbird
    # ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "kmdavidds";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Install firefox.
  programs.firefox.enable = true;

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = { inherit inputs; };
    users = {
      "kmdavidds" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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
    (import ./pkgs/first-pkg.nix { inherit pkgs; })
    (import ./pkgs/mkdir-nix/default.nix { inherit pkgs; })
    obs-studio
    zoom-us
    libreoffice-still
    hunspell
    hunspellDicts.en_US-large
    bruno
    bruno-cli
    docker-client
  ];

  environment.variables = {
    DIRENV_LOG_FORMAT = "";
  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  systemd.packages = [ pkgs.cloudflare-warp ]; # for warp-cli
  systemd.targets.multi-user.wants = [ "warp-svc.service" ]; # causes warp-svc to be started automatically

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
           caps a s d 
           f g h j 
           k l ; i 
           [ ] ' u 
           o n p m 
           . spc \
          )
          (defvar
           tap-time 200
           hold-time 200
          )
          (defalias
           caps (tap-hold 100 100 esc (layer-while-held arrow))
           a (tap-hold $tap-time $hold-time a lmet)
           s (tap-hold $tap-time $hold-time s lalt)
           d (tap-hold $tap-time $hold-time d lsft)
           f (tap-hold $tap-time $hold-time f lctl)
           j (tap-hold $tap-time $hold-time j lctl)
           k (tap-hold $tap-time $hold-time k lsft)
           l (tap-hold $tap-time $hold-time l lalt)
           ; (tap-hold $tap-time $hold-time ; lmet)
           [ bspc 
           spc (tap-hold $tap-time $hold-time spc (layer-while-held number))
           ] (tap-hold 1000 1000 ] (layer-switch base))
           \ (tap-hold 1000 1000 \ (layer-switch default))

           a1 (tap-hold $tap-time $hold-time 1 lmet)
           s2 (tap-hold $tap-time $hold-time 2 lalt)
           d3 (tap-hold $tap-time $hold-time 3 lsft)
           f4 (tap-hold $tap-time $hold-time 4 lctl)
           g5 5
           h6 6
           j7 (tap-hold $tap-time $hold-time 7 lctl)
           k8 (tap-hold $tap-time $hold-time 8 lsft)
           l9 (tap-hold $tap-time $hold-time 9 lalt)
           ;0 (tap-hold $tap-time $hold-time 0 lmet)
          )
          (deflayer base
           @caps @a  @s  @d  
           @f _ _ @j  
           @k  @l  @; _ 
           @[ @] ret _ 
           _ _ _ _ 
           _ @spc @\
          )
          (deflayer arrow
           _ _ _ _ 
           _ _ _ left 
           down right _ up 
           _ _ _ home 
           end _ _ pgup 
           pgdn _ _
          )
          (deflayer default
           _ _ _ _ 
           _ _ _ _ 
           _ _ _ _ 
           _ @] _ _ 
           _ _ _ _ 
           _ _ @\
          )
          (deflayer number
           @caps @a1 @s2 @d3 
           @f4 @g5 @h6 @j7 
           @k8 @l9 @;0 _ 
           @[ @] _ [ 
           ] ' \ = 
           - @spc _
          )
        '';
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
