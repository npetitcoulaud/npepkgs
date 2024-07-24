{ pkgs ? import <nixpkgs> { } }:
let
  fs = pkgs.lib.fileset;
  sourceFiles = ./resources/.;
in fs.trace sourceFiles pkgs.stdenv.mkDerivation {
  name = "wallpapers";
  src = fs.toSource {
    root = ./resources;
    fileset = sourceFiles;
  };

  installPhase = ''
    mkdir $out
    cp * $out
  '';
}
