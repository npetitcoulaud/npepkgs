{
  pkgs ? import <nixpkgs> { },
}:

pkgs.stdenv.mkDerivation {
  name = "hyprcwd";
  src = pkgs.fetchFromGitHub {
    repo = "hyprcwd";
    owner = "vilari-mickopf";
    rev = "4a199972b11372c1bf5079b13e7130055e6c8453";
    sha256 = "sha256-jQCO+3MYVqvkqypS143TcAqrWiTduYn+70sZTpDRv8k=";
  };

  buildPhase = ''
    mkdir -p $out/bin
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp hyprcwd $out/bin
  '';
}
