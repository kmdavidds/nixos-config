{
  lib,
  ...
}:

{
  programs.hyprlock.enable = false;
  programs.hyprlock.settings = lib.mkForce {
    "general" = {
      "hide_cursor" = true;
      "ignore_empty_input" = true;
    };

    "animations" = {
      "enabled" = "true";
      "bezier" = "linear, 1, 1, 0, 0";
      "animation" = [
        "fadeIn, 1, 5, linear"
        "fadeOut, 1, 5, linear"
        "inputFieldDots, 1, 2, linear"
      ];
    };

    "background" = {
      "monitor" = "";
      "path" = "/home/kmdavidds/Projects/nixos-config/modules/home-manager/swww/current-wallpaper.png";
      "blur_passes" = "3";
    };

    "input-field" = {
      "monitor" = "";
      "size" = "20%, 5%";
      "outline_thickness" = "2";
      "inner_color" = "rgba(0, 0, 0, 0.0)";

      "outer_color" = "rgba(00c1e4cc) rgb(B0E0E6) rgb(B0E0E6) rgba(00c1e4cc) 90deg";
      "check_color" = "rgba(f9e2afee) rgba(fab387ee) 45deg";
      "fail_color" = "rgba(ff6633ee) rgba(ff0066ee) 45deg";

      "font_color" = "rgb(255, 255, 255)";
      "fade_on_empty" = "false";
      "rounding" = "15";

      "font_family" = "$font";
      "placeholder_text" = "";
      "fail_text" = "Authentication Failed";

      # uncomment to use a letter instead of a dot to indicate the typed password
      # "dots_text_format" = "*";
      # "dots_size" = "0.4";
      "dots_spacing" = "0.3";

      # uncomment to use an input indicator that does not show the password length (similar to swaylock's input indicator)
      # "hide_input" = "true";

      "position" = "0, 0";
      "halign" = "center";
      "valign" = "center";
    };
  };
}
