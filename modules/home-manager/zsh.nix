{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      nr = "sudo nixos-rebuild switch --flake .";
      meow = "kitten icat";
      cat = "bat";
      c = "code .";
      ls = "eza --icons --long --no-permissions --no-filesize --no-user --no-time --all";
      l = "eza --icons --long --all";
      lt = "eza --icons --long --tree";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        { name = "MichaelAquilina/zsh-you-should-use"; } # Simple plugin installation
      ];
    };
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
}
