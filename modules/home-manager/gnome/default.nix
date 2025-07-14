{ ... }:

{
  dconf = {
    settings = {
      "org/gnome/desktop/wm/keybindings" = {
        switch-to-workspace-1 = ["<Super>j"];
        switch-to-workspace-2 = ["<Super>k"];
        switch-to-workspace-3 = ["<Super>l"];
        switch-to-workspace-4 = ["<Super>semicolon"];
        switch-to-workspace-5 = ["<Super>m"];
        switch-to-workspace-6 = ["<Super>comma"];
        switch-to-workspace-7 = ["<Super>period"];
        switch-to-workspace-8 = ["<Super>slash"];
        move-to-workspace-1 = ["<Shift><Super>j"];
        move-to-workspace-2 = ["<Shift><Super>k"];
        move-to-workspace-3 = ["<Shift><Super>l"];
        move-to-workspace-4 = ["<Shift><Super>semicolon"];
        move-to-workspace-5 = ["<Shift><Super>m"];
        move-to-workspace-6 = ["<Shift><Super>comma"];
        move-to-workspace-7 = ["<Shift><Super>period"];
        move-to-workspace-8 = ["<Shift><Super>slash"];
        toggle-message-tray = ["<Super>b"];
        maximize = ["<Alt><Super>i"];
        unmaximize = ["<Alt><Super>k"];
        toggle-tiled-left = ["<Alt><Super>j"];
        toggle-tiled-right = ["<Alt><Super>l"];
        toggle-fullscreen = ["<Alt><Super>u"];
        cycle-windows = ["<Alt>s"];
        close = ["<Alt>r"];
      };
      "org.gnome.desktop.interface" = {
        gtk-theme = ["catppuccin"];
        color-scheme = ["prefer-dark"];
      };
    };
  };
}
