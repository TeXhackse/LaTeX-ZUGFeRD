{
  description = "ZUGFerd demo flake";
  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    zugferd = { url = "github:TeXhackse/LaTeX-ZUGFeRD"; flake = false; };
  };
  outputs = { self, nixpkgs, flake-utils, zugferd, ... }@inputs:
    with flake-utils.lib; eachSystem allSystems (system:
    let
      pkgs = import inputs.nixpkgs-unstable {
          inherit system;
      };
      fs = pkgs.lib.fileset;
      packageFile= ./nix-flake-depends.txt;
      src = fs.toSource {
              root = "./.";
              fileset = packageFile;
      };
      input = builtins.readFile packageFile;
      dependencies = builtins.concatMap (x:  builtins.match "([^\#]+)\#?.*"  x) (builtins.filter (x : builtins.match "([^\#]+)\#?.+" x != null) (pkgs.lib.strings.splitString "\n" input));
      packageSelector = ps: builtins.map (d: builtins.getAttr d ps) dependencies;
      tex = pkgs.texliveMinimal.withPackages packageSelector;
    in rec {
      packages = {
        document = pkgs.stdenvNoCC.mkDerivation rec {
          name = "document";
          src = self;
          buildInputs = [ pkgs.coreutils pkgs.which tex ];
          phases = ["unpackPhase" "buildPhase" "installPhase"];
          buildPhase = ''
            export PATH="${pkgs.lib.makeBinPath buildInputs}";
            export HOME=$(mktemp -d)
	        export TEXMFVAR="$TEXMFSYSVAR"
            	ZUGFERD_BUILD_DIR="zugferd"
            	cp -r ${zugferd} "$ZUGFERD_BUILD_DIR"
              l3build install
              latexmk
          '';
          installPhase = ''
            mkdir -p $out
            cp *.pdf $out/
          '';
        };
      };
      packages.default = packages.document;
    });
}
