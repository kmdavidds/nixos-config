{ pkgs }:
let
  bashScript = (builtins.readFile ./mkdir-nix.sh);
in
pkgs.writeShellApplication {
  name = "mkdir-nix";

  runtimeInputs = [
    pkgs.direnv
    pkgs.git
  ];

  text = bashScript;
}
