{ lib, ... }:

{
  # TODO: fix undetected kitty config in home manager
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
      background = "#1E1E1E";
    };

    extraConfig = ''
      font_size 18
      confirm_os_window_close 0
      dynamic_background_opacity yes
      mouse_hide_wait 1.0
      window_padding_width 10
      background_opacity 0.75
      background_blur 5
      background #1E1E1E
      map f1 launch --cwd=current --type=tab
      map Alt+c kitten kitty_grab/grab.py
    '';
  };
}
