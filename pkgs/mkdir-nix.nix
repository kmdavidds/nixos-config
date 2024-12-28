{ pkgs }:
let
  flakeText = ''
    {
      description = "A very basic nix mkShell flake";

      inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
      };

      outputs =
        {
          self,
          nixpkgs,
        }:
        let
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
        in
        {
          devShells."x86_64-linux".default = pkgs.mkShell {

            packages = [
              pkgs.gnumake
            ];

          };
        };
    }
  '';
in
pkgs.writeShellApplication {
  name = "mkdir-nix";

  runtimeInputs = [
    pkgs.direnv
    pkgs.git
  ];

  text = ''
    echo ${flakeText} >> flake.nix
    echo "use flake" >> .envrc
    git init
    direnv allow
  '';
}
