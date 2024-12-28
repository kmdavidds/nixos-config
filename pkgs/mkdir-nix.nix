{ pkgs }:

pkgs.writeShellApplication {
  name = "mkdir-nix";

  runtimeInputs = [
    pkgs.direnv
    pkgs.git
  ];

  text = ''
    mkdir "$1"
    cd "$1"
    echo -e "{\n  description = \"A very basic nix mkShell flake\";\n\n  inputs = {\n    nixpkgs.url = \"github:nixos/nixpkgs?ref=nixos-unstable\";\n  };\n\n  outputs =\n    {\n      self,\n      nixpkgs,\n    }:\n    let\n      pkgs = nixpkgs.legacyPackages.\"x86_64-linux\";\n    in\n    {\n      devShells.\"x86_64-linux\".default = pkgs.mkShell {\n\n        packages = [\n          pkgs.gnumake\n        ];\n\n      };\n    };\n}" >> flake.nix
    echo "use flake" >> .envrc
    echo -e ".envrc \n.direnv" >> .gitignore
    direnv allow
    git init
    git add .
    git commit -m "init flake"
  '';
}
