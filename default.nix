{ pkgs ? import <nixpkgs> { }, system ? builtins.currentSystem }:

{
  space-theme = pkgs.callPackage ./pkgs/space-theme { };
  openfortivpn-webview-qt = pkgs.callPackage ./pkgs/openfortivpn-webview-qt { };
  wallpapers = pkgs.callPackage ./pkgs/wallpapers { };
}
