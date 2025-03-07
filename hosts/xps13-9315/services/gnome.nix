{ ... }:

{
  # use gnome as display backend
  services.xserver.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;
}