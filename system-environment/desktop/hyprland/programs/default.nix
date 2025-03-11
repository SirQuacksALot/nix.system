{ ... }: {
  imports = [
    ./swww
    ./waybar
    ./kitty
    ./rofi-wayland
    ./swaynotificationcenter
  ];

	# programs.git.enable = true;
  # programs.virt-manager.enable = false;
  programs.xwayland.enable = true;

  programs.dconf.enable = true;
  programs.fuse.userAllowOther = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.nm-applet.indicator = true;

  # Extra Portal Configuration
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
  };

}