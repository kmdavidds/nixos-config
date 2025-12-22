{
  lib,
  ...
}:

{
  programs.zsh = {
    enable = true;
    zprof.enable = false;
    dotDir = ".config/zsh";
    enableCompletion = false;
    shellAliases = {
      nr = "sudo nixos-rebuild switch --flake .";
      meow = "kitten icat";
      c = "code .";
      ls = "eza --icons --no-permissions --no-filesize --no-user --no-time --all";
      l = "eza --icons --long --all";
      lt = "eza --icons --long --tree";
      top = "btop --update 100";
      m = "mkdir-nix";
      sail = "./vendor/bin/sail";
      sphp = "./vendor/bin/sail";
      ds = "docker ps";
      dis = "docker image ls";
      dcu = "docker context use";
      ssh = "TERM=xterm-256color ssh";
      cd = "z";
    };
    antidote = {
      enable = true;
      useFriendlyNames = true;
      plugins = [
        # "mattmc3/zephyr path:plugins/completion"
        # "belak/zsh-utils path:editor"
        "zsh-users/zsh-autosuggestions"
        "zdharma-continuum/fast-syntax-highlighting"
      ];
    };
    completionInit = ''
      ## See https://gist.github.com/ctechols/ca1035271ad134841284
      autoload -Uz compinit
      [[ -n ''${ZDOTDIR}/.zcompdump(#qN.mh+24) ]] && compinit || compinit -C
    '';
    initContent = lib.mkBefore ''
      ## Profiling zsh startup
      [[ -n "''${ZSH_DEBUGRC+1}" ]] && zmodload zsh/zprof
      if [ -z "''${WAYLAND_DISPLAY}" ] && [ "''${XDG_VTNR}" -eq 1 ]; then
        dbus-run-session Hyprland
      fi
    '';
  };

  programs.bat = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.btop = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
  };
}
