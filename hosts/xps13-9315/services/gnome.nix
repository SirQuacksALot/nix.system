{ ... }:

{
  # use gnome as display backend
  services.xserver.enable = true;
  services.xserver.displayManager.gddm.enable = true;
  services.xserver.displayManager.gddm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;
}