{
  lib,
  ...
}:

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
      exec-once = [
        "sleep 1 && caelestia shell lock lock"
        "sleep 1 && warp-cli disconnect"
      ];

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
      "$menu" =
        "rofi -show drun -theme /home/kmdavidds/Projects/nixos-config/modules/home-manager/rofi/config.rasi";

      #################
      ### AUTOSTART ###
      #################

      # Autostart necessary processes (like notifications daemons, status bars, etc.)
      # Or execute your favorite apps at launch like this:

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
        "col.active_border" = "rgba(00c1e4cc) rgb(B0E0E6) rgb(B0E0E6) rgba(00c1e4cc) 90deg";
        "col.inactive_border" = "rgba(595959aa)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        "resize_on_border" = "true";

        # Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        "allow_tearing" = "false";

        "layout" = "dwindle";
      };

      # https://wiki.hypr.land/Configuring/Variables/#decoration
      "decoration" = {
        "rounding" = "20";
        "rounding_power" = "2";

        # Change transparency of focused and unfocused windows
        "active_opacity" = "1.0";
        "inactive_opacity" = "1.0";

        "shadow" = {
          "enabled" = "false";
          "range" = "4";
          "render_power" = "3";
          "color" = "rgba(ffffff69)";
        };

        # https://wiki.hypr.land/Configuring/Variables/#blur
        "blur" = {
          "enabled" = "true";
          "size" = "7";
          "noise" = "0.08";
          "contrast" = "1.5";
          "passes" = "3";
        };
      };

      # https://wiki.hypr.land/Configuring/Variables/#animations
      "animations" = {
        "enabled" = "yes, please :)";

        "bezier" = [
          "snappy,0.25,0.1,0.25,1"
          "snapIn,0.4,0,0.6,1"
          "snapOut,0.2,0,0.4,1"
          "instant,0,0,1,1"
        ];

        "animation" = [
          "global, 1, 4, snappy"

          "windows, 1, 3, snapOut, slide"
          "windowsIn, 1, 3, snapOut, popin 92%"
          "windowsOut, 1, 1.5, snapIn, popin 92%"

          "fadeIn, 1, 2, snapOut"
          "fadeOut, 1, 1.5, snapIn"
          "fade, 1, 2, snappy"

          "layers, 1, 2.5, snapOut"
          "layersIn, 1, 2.5, snapOut, slide"
          "layersOut, 1, 1.5, snapIn, slide"
          "fadeLayersIn, 1, 2, snapOut"
          "fadeLayersOut, 1, 1.5, snapIn"

          "workspaces, 1, 3, snapOut, slide"

          "border, 1, 2, snappy"
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
        "vfr" = "true";
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

      # https://wiki.hypr.land/Configuring/Gestures
      "gesture" = "3, horizontal, workspace";

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
        "$mainMod, F, togglefloating,"
        "$mainMod, P, global, caelestia:session"
        "$mainMod, R, global, caelestia:launcher"
        "$mainMod, A, global, caelestia:showall"
        "$mainMod, N, exec, caelestia shell drawers toggle sidebar"
        "$mainMod, I, exec, caelestia shell drawers toggle dashboard"
        "$mainMod, V, exec, kitty --class clipse -e 'clipse'"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, J, workspace, 1"
        "$mainMod, K, workspace, 2"
        "$mainMod, L, workspace, 3  "
        "$mainMod, SEMICOLON, workspace, 4"
        "$mainMod, M, workspace, 5"
        "$mainMod, COMMA, workspace, 6"
        "$mainMod, PERIOD, workspace, 7"
        "$mainMod, SLASH, workspace, 8"
        "ALT, TAB, workspace, previous"

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
        ", PRINT, global, caelestia:screenshotFreeze"
        "CTRL, PRINT, global, caelestia:screenshot"

        # Color Picker
        "CTRL+SHIFT, PRINT, exec, hyprpicker -a"

        # Emoji Picker
        "SUPER+ALT, Period, exec, caelestia emoji -p"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      "bindm" = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
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
        # "opacity 0.85 0.85,class:^(zen-beta)$"
        # "opacity 0.85 0.85,class:^(zen)$"
        "opacity 0.85 0.85,class:^(spotify)$"
        "opacity 0.85 0.85,class:^(Postman)$"
        "idleinhibit always, title:(.*)(- YouTube — Zen Browser)"
        "idleinhibit always, title:(nr)"
      ];

      "layerrule" = [
        "blur, logout_dialog"
        "xray 1, logout_dialog"
        "animation slide, logout_dialog"
        "noanim, selection"
        "blur, rofi"
        "dimaround, rofi"
        "animation slide, rofi"
      ];

      # Caelestia
      "exec" = "hyprctl dispatch submap global";
      "submap" = "global";

      # Shell keybinds
      # Launcher
      "bindin" = [
        "Super, mouse:272, global, caelestia:launcherInterrupt"
        "Super, mouse:273, global, caelestia:launcherInterrupt"
        "Super, mouse:274, global, caelestia:launcherInterrupt"
        "Super, mouse:275, global, caelestia:launcherInterrupt"
        "Super, mouse:276, global, caelestia:launcherInterrupt"
        "Super, mouse:277, global, caelestia:launcherInterrupt"
        "Super, mouse_up, global, caelestia:launcherInterrupt"
        "Super, mouse_down, global, caelestia:launcherInterrupt"
      ];

      # Brightness
      "bindl" = [
        ", XF86MonBrightnessUp, global, caelestia:brightnessUp"
        ", XF86MonBrightnessDown, global, caelestia:brightnessDown"
        # Media
        ", XF86AudioPlay, global, caelestia:mediaToggle"
        ", XF86AudioPause, global, caelestia:mediaToggle"
        ", XF86AudioNext, global, caelestia:mediaNext"
        ", XF86AudioPrev, global, caelestia:mediaPrev"
        ", XF86AudioStop, global, caelestia:mediaStop"
        # Audio
        "Super, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      "bindel" = [
        ", XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
    };
  };
}
