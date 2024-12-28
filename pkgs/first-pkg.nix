{ pkgs }:

pkgs.writeShellApplication {
  name = "first-pkg";

  runtimeInputs = [pkgs.cowsay pkgs.lolcat];

  text = ''
    echo "Hello, World!" | cowsay | lolcat
  '';
}