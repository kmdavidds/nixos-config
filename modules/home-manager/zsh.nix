{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = false;
    shellAliases = {
      nr = "sudo nixos-rebuild switch --flake .";
      meow = "kitten icat";
      cat = "bat";
      c = "code .";
      ls = "eza --icons --no-permissions --no-filesize --no-user --no-time --all";
      l = "eza --icons --long --all";
      lt = "eza --icons --long --tree";
      top = "btop --update 100";
      m = "mkdir-nix";
      sail = "./vendor/bin/sail";
      ds = "docker ps";
      dis = "docker image ls";
    };
    antidote = {
      enable = true;
      useFriendlyNames = true;
      plugins = [
        "mattmc3/zephyr path:plugins/completion"
        "belak/zsh-utils path:editor"
        "zsh-users/zsh-autosuggestions"
        "zdharma-continuum/fast-syntax-highlighting"
      ];
    };
    completionInit = ''
      ## See https://gist.github.com/ctechols/ca1035271ad134841284
      autoload -Uz compinit
      [[ -n ''${ZDOTDIR}/.zcompdump(#qN.mh+24) ]] && compinit || compinit -C
    '';
    initExtraFirst = ''
      ## Profiling zsh startup
      [[ -n "''${ZSH_DEBUGRC+1}" ]] && zmodload zsh/zprof
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
