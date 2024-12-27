{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true; 
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.bash.enable = true;
}
