mkdir "$1"
cd "$1"
flake=$(
    cat <<END
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
END
)
echo "$flake" >>flake.nix
echo "use flake" >> .envrc
echo -e ".envrc \n.direnv" >>.gitignore
direnv allow
git init
git add .
git commit -m "init flake"