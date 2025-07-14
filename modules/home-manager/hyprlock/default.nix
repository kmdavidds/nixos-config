{
  programs.hyprlock.enable = true;
  programs.hyprlock.extraConfig = ''
        animations {
        enabled = true
        bezier = linear, 1, 1, 0, 0
        animation = fadeIn, 1, 5, linear
        animation = fadeOut, 1, 5, linear
        animation = inputFieldDots, 1, 2, linear
    }

    background {
        monitor =
        path = /home/kmdavidds/Pictures/eveningsky.png
        blur_passes = 3
    }

    input-field {
        monitor =
        size = 20%, 5%
        outline_thickness = 3
        inner_color = rgba(0, 0, 0, 0.0) # no fill

        outer_color = rgba(f38ba8ee) rgba(cba6f7ee) 45deg
        check_color = rgba(f9e2afee) rgba(fab387ee) 45deg
        fail_color = rgba(ff6633ee) rgba(ff0066ee) 45deg

        font_color = rgb(143, 143, 143)
        fade_on_empty = false
        rounding = 15

        font_family = $font
        placeholder_text = Input password...
        fail_text = $PAMFAIL

        # uncomment to use a letter instead of a dot to indicate the typed password
        # dots_text_format = *
        # dots_size = 0.4
        dots_spacing = 0.3

        # uncomment to use an input indicator that does not show the password length (similar to swaylock's input indicator)
        # hide_input = true

        position = 0, -20
        halign = center
        valign = center
    }
  '';
}
