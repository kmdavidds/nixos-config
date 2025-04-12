mkdir "$1"
cd "$1"
flake1=$(
    cat <<END
{
  description = "A very basic nix mkShell flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
END
)
flake2=$(
    cat <<END
        ];

      };
    };
}
END
)

echo "$flake1" >>flake.nix

flag=1
for var in "$@"; do
    if [[ "$flag" -gt 1 ]]; then
        echo "          pkgs.$var" >>flake.nix
    fi
    flag=$((flag+1))
done

echo "$flake2" >>flake.nix
echo "use flake" >>.envrc
echo -e ".envrc \n.direnv" >>.gitignore
direnv allow
git init
git add .
git commit -m "init flake"
