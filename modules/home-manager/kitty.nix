{ lib, ... }:

{
  programs.kitty = lib.mkForce {
    enable = true;
    font = {
      name = "Fira Code";
      size = 18;
    };
    shellIntegration.enableZshIntegration = true;

    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      mouse_hide_wait = "1.0";
      window_padding_width = 10;
      background_opacity = "0.75";
      background_blur = 5;
    };
  };
}
