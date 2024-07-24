{ pkgs, ... }:

pkgs.stdenv.mkDerivation {

  name = "openfortivpn-webview-qt";
  src = pkgs.fetchFromGitHub {
    repo = "openfortivpn-webview";
    owner = "gm-vm";
    rev = "48e831167c25f10a33b4fd793ba3442ff0c89099";
    hash = "sha256-UJu0rD/mmb68daVtSe0Ll3DjL9NSOtIvBy0uypkNiXU=";
  };

  buildInputs = [ pkgs.qt6.qtbase pkgs.qt6.qtwebengine ];
  nativeBuildInputs = [ pkgs.qt6.wrapQtAppsHook ];
  dontWrapQtApps = true;

  installPhase = ''
    cd openfortivpn-webview-qt
    qmake .
    make
    mkdir -p $out/bin
    mv openfortivpn-webview $out/bin/
  '';
}
