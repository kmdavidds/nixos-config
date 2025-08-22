{
  pkgs,
  inputs,
  lib,
  ...
}:

{
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        autoSkipVideo
        beautifulLyrics
      ];

      theme = lib.mkForce spicePkgs.themes.flow;
      colorScheme = lib.mkForce "Ocean";
    };
}
