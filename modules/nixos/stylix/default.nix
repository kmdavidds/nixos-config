{
  pkgs,
  ...
}:

{
  # Use stylix
  stylix = {
    enable = true;
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/HyDE-Project/hyde-themes/refs/heads/Catppuccin-Mocha/Configs/.config/hyde/themes/Catppuccin%20Mocha/wallpapers/evening_sky.png";
      sha256 = "fYMzoY3un4qGOSR4DMqVUAFmGGil+wUze31rLLrjcAc=";
    };
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    fonts = {
      monospace = {
        package = pkgs.fira-code;
        name = "Fira Code";
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 8;
    };
    opacity = {
      applications = 0.75;
      desktop = 0.75;
      popups = 0.75;
    };
    targets = {
      spicetify.enable = false;
    };
  };
}
