{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation rec {
  name = "space-theme";
  srcs = [
    (pkgs.fetchFromGitHub {
      repo = "Space";
      owner = "EliverLara";
      rev = "3a6799d8cfa4b83b0cd03c95deb8bd17a8dd0510";
      sha256 = "sha256-isxJ4UsT92CdpUpugFmYgoib7RtAZLeGOEeSLDZ92Ho=";
      name = name;
    })
    (pkgs.fetchFromGitHub {
      repo = "Space";
      owner = "EliverLara";
      rev = "0fc24e6feb5021a249c8065824889ba5cdca28fb";
      sha256 = "sha256-oUrUc7Wu8eHh1c0mlBonKGTMMuvzW89LJFv6xmePTYM=";
      name = "space-dark";
    })
    (pkgs.fetchFromGitHub {
      repo = "Space";
      owner = "EliverLara";
      rev = "172346b4b669ffa3d65c763c4a9411520ed9366a";
      sha256 = "sha256-6prRG+D3LSSFyQT9Ace/+5klIHFxdyexN01s2NacbVE=";
      name = "space-transparency";
    })
  ];
  sourceRoot = name;
  installPhase = ''
    mkdir -p $out/share/themes/{Space-light,Space-dark,Space-transparency}
    cp -r assets cinnamon gnome-shell gtk-2.0 gtk-3.0 gtk-4.0 metacity-1 xfwm4 index.theme $out/share/themes/Space-light
    cp -r ../space-dark/assets ../space-dark/cinnamon ../space-dark/gnome-shell ../space-dark/gtk-2.0 ../space-dark/gtk-3.0 ../space-dark/gtk-4.0 ../space-dark/metacity-1 ../space-dark/xfwm4 ../space-dark/index.theme $out/share/themes/Space-dark
    cp -r ../space-transparency/assets ../space-transparency/cinnamon ../space-transparency/gnome-shell ../space-transparency/gtk-2.0 ../space-transparency/gtk-3.0 ../space-transparency/gtk-4.0 ../space-transparency/metacity-1 ../space-transparency/xfwm4 ../space-transparency/index.theme $out/share/themes/Space-transparency
  '';

  meta = with pkgs.lib; {
    description = "An elegant dark/light theme for Gnome";
    homepage = "https://github.com/EliverLara/Space";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ npetitcoulaud ];
    platforms = platforms.unix;
  };
}
