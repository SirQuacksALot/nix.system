{ ... }: {
  # file viewer
  thunar.enable = true;
  thunar.plugins = with pkgs.xfce; [
    exo
    mousepad
    thunar-archive-plugin
    thunar-volman
    tumbler
  ];
}