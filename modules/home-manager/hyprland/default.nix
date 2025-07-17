# home.nix

{
  pkgs,
  lib,
  ...
}:

let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.hyprlock}/bin/hyprlock &

    ${pkgs.swww}/bin/swww init &

    sleep 1

    ${pkgs.swww}/bin/swww img /home/kmdavidds/Pictures/eveningsky.png &

    ${pkgs.networkmanagerapplet}/bin/nm-applet --indicator &

    ${pkgs.dunst}/bin/dunst &

    ${pkgs.clipse}/bin/clipse -listen &
  '';
in
{
  services.swww.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;

    # example convert from hyprland syntax to nix syntax

    # $mod=SUPER
    # decoration {
    #   col.shadow=rgba(00000099)
    #   shadow_offset=0 5
    # }
    # bindm=$mod, mouse:272, movewindow
    # bindm=$mod, mouse:273, resizewindow
    # bindm=$mod ALT, mouse:272, resizewindow

    # {
    #   "$mod" = "SUPER";
    #   "decoration" = {
    #     "shadow_offset" = "0 5";
    #     "col.shadow" = "rgba(00000099)";
    #   };
    #   "bindm" = [
    #     "$mod, mouse:272, movewindow"
    #     "$mod, mouse:273, resizewindow"
    #     "$mod ALT, mouse:272, resizewindow"
    #   ];
    # };

    settings = lib.mkForce {
      exec-once = ''${startupScript}/bin/start'';

      # This is an example Hyprland config file.
      # Refer to the wiki for more information.
      # https://wiki.hypr.land/Configuring/

      # Please note not all available settings / options are set here.
      # For a full list, see the wiki

      # You can split this configuration into multiple files
      # Create your files separately and then link them to this file like this:
      # source = "~/.config/hypr/myColors.conf"

      ################
      ### MONITORS ###
      ################

      # See https://wiki.hypr.land/Configuring/Monitors/
      "monitor" = ",preferred,auto,1";

      ###################
      ### MY PROGRAMS ###
      ###################

      # See https://wiki.hypr.land/Configuring/Keywords/

      # Set programs that you use
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi --show drun --show-icons";

      #################
      ### AUTOSTART ###
      #################

      # Autostart necessary processes (like notifications daemons, status bars, etc.)
      # Or execute your favorite apps at launch like this:

      # "exec-once" = [
      #   "$terminal"
      #   "nm-applet &"
      #   "waybar & hyprpaper & firefox"
      # ];

      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################

      # See https://wiki.hypr.land/Configuring/Environment-variables/

      "env" = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      ###################
      ### PERMISSIONS ###
      ###################

      # See https://wiki.hypr.land/Configuring/Permissions/
      # Please note permission changes here require a Hyprland restart and are not applied on-the-fly
      # for security reasons

      # "ecosystem" = {
      #   "enforce_permissions" = "1";
      # };

      # "permission" = [
      #   "/usr/(bin|local/bin)/grim, screencopy, allow"
      #   "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland, screencopy, allow"
      #   "/usr/(bin|local/bin)/hyprpm, plugin, allow"
      # ];

      #####################
      ### LOOK AND FEEL ###
      #####################

      # Refer to https://wiki.hypr.land/Configuring/Variables/

      # https://wiki.hypr.land/Configuring/Variables/#general
      "general" = {
        "gaps_in" = "5";
        "gaps_out" = "20";

        "border_size" = "2";

        # https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
        "col.active_border" = "rgba(f38ba8ee) rgba(cba6f7ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        "resize_on_border" = "false";

        # Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        "allow_tearing" = "false";

        "layout" = "dwindle";
      };

      # https://wiki.hypr.land/Configuring/Variables/#decoration
      "decoration" = {
        "rounding" = "10";
        "rounding_power" = "2";

        # Change transparency of focused and unfocused windows
        "active_opacity" = "1.0";
        "inactive_opacity" = "1.0";

        "shadow" = {
          "enabled" = "true";
          "range" = "4";
          "render_power" = "3";
            "color" = "rgba(ffffff69)";
        };

        # https://wiki.hypr.land/Configuring/Variables/#blur
        "blur" = {
          "enabled" = "true";
          "size" = "3";
          "passes" = "1";

          "vibrancy" = "0.1696";
        };
      };

      # https://wiki.hypr.land/Configuring/Variables/#animations
      "animations" = {
        "enabled" = "yes, please :)";

        # Default animations, see https://wiki.hypr.land/Configuring/Animations/ for more

        "bezier" = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        "animation" = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, easeOutQuint, slide"
          "workspacesIn, 1, 5, easeOutQuint, slide"
          "workspacesOut, 1, 5, easeOutQuint, slide"
        ];
      };

      # Ref https://wiki.hypr.land/Configuring/Workspace-Rules/
      # "Smart gaps" / "No gaps when only"
      # uncomment all if you wish to use that.
      # "workspace" = [
      #   "w[tv1], gapsout:0, gapsin:0"
      #   "f[1], gapsout:0, gapsin:0"
      # ];
      # "windowrule" = [
      #   "bordersize 0, floating:0, onworkspace:w[tv1]"
      #   "rounding 0, floating:0, onworkspace:w[tv1]"
      #   "bordersize 0, floating:0, onworkspace:f[1]"
      #   "rounding 0, floating:0, onworkspace:f[1]"
      # ];

      # See https://wiki.hypr.land/Configuring/Dwindle-Layout/ for more
      "dwindle" = {
        "pseudotile" = "true"; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        "preserve_split" = "true"; # You probably want this
      };

      # See https://wiki.hypr.land/Configuring/Master-Layout/ for more
      "master" = {
        "new_status" = "master";
      };

      # https://wiki.hypr.land/Configuring/Variables/#misc
      "misc" = {
        "force_default_wallpaper" = "0"; # Set to 0 or 1 to disable the anime mascot wallpapers
        "disable_hyprland_logo" = "true"; # If true disables the random hyprland logo / anime girl background. :(
      };

      #############
      ### INPUT ###
      #############

      # https://wiki.hypr.land/Configuring/Variables/#input
      "input" = {
        "kb_layout" = "us";
        "kb_variant" = "";
        "kb_model" = "";
        "kb_options" = "";
        "kb_rules" = "";

        "follow_mouse" = "1";

        "sensitivity" = "0"; # -1.0 - 1.0, 0 means no modification.

        "touchpad" = {
          "natural_scroll" = "true";
        };
      };

      # https://wiki.hypr.land/Configuring/Variables/#gestures
      "gestures" = {
        "workspace_swipe" = "true";
      };

      # Example per-device config
      # See https://wiki.hypr.land/Configuring/Keywords/#per-device-input-configs for more
      "device" = {
        "name" = "epic-mouse-v1";
        "sensitivity" = "-0.5";
      };

      ###################
      ### KEYBINDINGS ###
      ###################

      # See https://wiki.hypr.land/Configuring/Keywords/
      "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier

      # Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more
      "bind" = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, N, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, F, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, exec, wlogout -b 6"
        "$mainMod, V, exec, kitty --class clipse -e 'clipse'"
        "$mainMod, B, togglesplit," # dwindle

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, J, workspace, 1"
        "$mainMod, K, workspace, 2"
        "$mainMod, L, workspace, 3"
        "$mainMod, SEMICOLON, workspace, 4"
        "$mainMod, M, workspace, 5"
        "$mainMod, COMMA, workspace, 6"
        "$mainMod, PERIOD, workspace, 7"
        "$mainMod, SLASH, workspace, 8"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, J, movetoworkspace, 1"
        "$mainMod SHIFT, K, movetoworkspace, 2"
        "$mainMod SHIFT, L, movetoworkspace, 3"
        "$mainMod SHIFT, SEMICOLON, movetoworkspace, 4"
        "$mainMod SHIFT, M, movetoworkspace, 5"
        "$mainMod SHIFT, COMMA, movetoworkspace, 6"
        "$mainMod SHIFT, PERIOD, movetoworkspace, 7"
        "$mainMod SHIFT, SLASH, movetoworkspace, 8"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Screenshot
        ", PRINT, exec, hyprshot -m region"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      "bindm" = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Laptop multimedia keys for volume and LCD brightness
      "bindel" = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      # Requires playerctl
      "bindl" = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      # See https://wiki.hypr.land/Configuring/Window-Rules/ for more
      # See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules

      # Example windowrule
      # "windowrule" = "float,class:^(kitty)$,title:^(kitty)$";

      # Ignore maximize requests from apps. You'll probably like this.
      "windowrule" = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        "float,class:(clipse)"
        "size 1159 652,class:(clipse)"
        "stayfocused,class:(clipse)"
      ];

      "windowrulev2" = [
        "opacity 0.85 0.85,class:^(code-url-handler)$"
        "opacity 0.85 0.85,class:^(code)$"
        "opacity 0.85 0.85,class:^(zen-beta)$"
        "opacity 0.85 0.85,class:^(zen)$"
        "opacity 0.85 0.85,class:^(spotify)$"
        "opacity 0.85 0.85,class:^(Postman)$"
      ];
    };
  };
}
