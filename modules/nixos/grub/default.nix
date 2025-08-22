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
          pname = "bsol";
          version = "8f39f66967e2391b11ee554578f0b821070ec72a";
          src = pkgs.fetchFromGitHub {
            "owner" = "harishnkr";
            "repo" = "bsol";
            "rev" = "8f39f66967e2391b11ee554578f0b821070ec72a";
            "hash" = "sha256-UD5crwJdqnKVnxTN2vHIukJnQuzxmkko3E5wb8Xg6gs=";
          };
          installPhase = "cp -r ./bsol/ $out";
        }
      );
      timeout = 0;
      timeoutStyle = "countdown";
    };
  };

  boot.loader.efi.canTouchEfiVariables = true;
}
