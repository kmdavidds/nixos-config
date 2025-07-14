{
  # Use kanata
  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
           caps a s d
           f g h j
           k l ; i
           [ ] ' u
           o n p m
           . spc \
          )
          (defvar
           tap-time 200
           hold-time 200
          )
          (defalias
           caps (tap-hold 100 100 esc (layer-while-held arrow))
           a (tap-hold $tap-time $hold-time a lmet)
           s (tap-hold $tap-time $hold-time s lalt)
           d (tap-hold $tap-time $hold-time d lsft)
           f (tap-hold $tap-time $hold-time f lctl)
           j (tap-hold $tap-time $hold-time j lctl)
           k (tap-hold $tap-time $hold-time k lsft)
           l (tap-hold $tap-time $hold-time l lalt)
           ; (tap-hold $tap-time $hold-time ; lmet)
           [ bspc
           spc (tap-hold $tap-time $hold-time spc (layer-while-held number))
           ] (tap-hold 1000 1000 ] (layer-switch base))
           \ (tap-hold 1000 1000 \ (layer-switch default))

           a1 (tap-hold $tap-time $hold-time 1 lmet)
           s2 (tap-hold $tap-time $hold-time 2 lalt)
           d3 (tap-hold $tap-time $hold-time 3 lsft)
           f4 (tap-hold $tap-time $hold-time 4 lctl)
           g5 5
           h6 6
           j7 (tap-hold $tap-time $hold-time 7 lctl)
           k8 (tap-hold $tap-time $hold-time 8 lsft)
           l9 (tap-hold $tap-time $hold-time 9 lalt)
           ;0 (tap-hold $tap-time $hold-time 0 lmet)
          )
          (deflayer base
           @caps @a  @s  @d
           @f _ _ @j
           @k  @l  @; _
           @[ @] ret _
           _ _ _ _
           _ @spc @\
          )
          (deflayer arrow
           _ _ _ _
           _ _ _ left
           down right _ up
           _ _ _ home
           end _ _ pgup
           pgdn _ _
          )
          (deflayer default
           _ _ _ _
           _ _ _ _
           _ _ _ _
           _ @] _ _
           _ _ _ _
           _ _ @\
          )
          (deflayer number
           @caps @a1 @s2 @d3
           @f4 @g5 @h6 @j7
           @k8 @l9 @;0 _
           @[ @] _ [
           ] ' \ =
           - @spc _
          )
        '';
      };
    };
  };
}

