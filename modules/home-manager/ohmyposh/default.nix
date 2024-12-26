{
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    # settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ./settings.json));
    settings = builtins.fromTOML (builtins.unsafeDiscardStringContext (builtins.readFile ./settings.toml));
  };
}