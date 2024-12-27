{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "kmdavidds";
    userEmail = "kmdavidds@gmail.com";
    ignores = ["*.env" "*.env.json" "*.env.yaml" "*.env.toml" "*.envrc"];
    extraConfig = {
      branch.sort = "committerdate";
      commit.gpgSign = true;
      commit.verbose = true;
      gpg.format = "ssh";
      init.defaultBranch = "main";
      merge.conflictStyle = "zdiff3";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}
