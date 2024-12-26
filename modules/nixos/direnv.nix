{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true; 
    enableZshIntergation = true;
    nix-direnv.enable = true;
  };

  programs.bash.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };
}
