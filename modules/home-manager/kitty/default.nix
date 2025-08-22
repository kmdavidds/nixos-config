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
      background_opacity = "0.85";
      background_blur = 5;
    };

    extraConfig = ''
            font_size 18
            confirm_os_window_close 0
            dynamic_background_opacity yes
            mouse_hide_wait 1.0
            window_padding_width 10
            background_opacity 0.85
            background_blur 5
            map f1 launch --cwd=current --type=tab
            map Alt+c kitten kitty_grab/grab.py


      # The basic colors
      foreground              #cdd3de
      background              #1b2b34
      selection_foreground    #1b2b34
      selection_background    #d8dee9

      # Cursor colors
      cursor                  #d8dee9
      cursor_text_color       #1b2b34

      # URL underline color when hovering with mouse
      url_color               #d8dee9

      # Kitty window border colors (using sky blue as accent)
      active_border_color     #5fb3b3
      inactive_border_color   #65737e
      bell_border_color       #fac863

      # OS Window titlebar colors
      wayland_titlebar_color system
      macos_titlebar_color system

      # Tab bar colors (using sky blue as accent)
      active_tab_foreground   #1b2b34
      active_tab_background   #5fb3b3
      inactive_tab_foreground #cdd3de
      inactive_tab_background #343d46
      tab_bar_background      #1b2b34

      # Colors for marks (marked text in the terminal)
      mark1_foreground #1b2b34
      mark1_background #5fb3b3
      mark2_foreground #1b2b34
      mark2_background #c594c5
      mark3_foreground #1b2b34
      mark3_background #6699cc

      # The 16 terminal colors

      # black
      color0 #343d46
      color8 #65737e

      # red
      color1 #ec5f67
      color9 #ec5f67

      # green
      color2  #99c794
      color10 #99c794

      # yellow
      color3  #fac863
      color11 #fac863

      # blue
      color4  #6699cc
      color12 #6699cc

      # magenta
      color5  #c594c5
      color13 #c594c5

      # cyan
      color6  #5fb3b3
      color14 #5fb3b3

      # white
      color7  #ab7967
      color15 #cdd3de
    '';
  };
}
