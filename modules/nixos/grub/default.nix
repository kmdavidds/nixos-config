{
  pkgs,
  lib,
  ...
}:

{
  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader = {
    grub = {
      enable = true;
      useOSProber = true;
      efiSupport = true;
      device = "nodev";
      theme = lib.mkForce (
        pkgs.stdenv.mkDerivation {
          pname = "fallout-grub-theme";
          version = "2c51d28701c03c389309e34585ca8ff2b68c23e9";
          src = pkgs.fetchFromGitHub {
            owner = "shvchk";
            repo = "fallout-grub-theme";
            rev = "2c51d28701c03c389309e34585ca8ff2b68c23e9";
            hash = "sha256-iQU1Rv7Q0BFdsIX9c7mxDhhYaWemuaNRYs+sR1DF0Rc=";
          };
          installPhase = "cp -r ./ $out";
        }
      );
    };
  };

  boot.loader.efi.canTouchEfiVariables = true;
}
