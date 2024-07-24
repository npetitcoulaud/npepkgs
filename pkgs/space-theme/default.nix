{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation {
  name = "space-theme";
  src = pkgs.fetchFromGitHub {
    repo = "Space";
    owner = "EliverLara";
    rev = "3a6799d8cfa4b83b0cd03c95deb8bd17a8dd0510";
    sha256 = "sha256-isxJ4UsT92CdpUpugFmYgoib7RtAZLeGOEeSLDZ92Ho=";
  };
  installPhase = ''
    mkdir -p $out/share/themes/space
    cp -r assets cinnamon gnome-shell gtk-2.0 gtk-3.0 gtk-4.0 metacity-1 xfwm4 index.theme $out/share/themes/space
  '';
}
