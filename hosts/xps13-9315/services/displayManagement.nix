{ pkgs, ... }:

{
  # use gnome as display backend
  services.xserver.enable = true;
  services.xserver.displayManager.defaultSession = "hyprland";
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  xdg.portal = {
    enable = true;
    extaPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gnome
    ];
  };
}