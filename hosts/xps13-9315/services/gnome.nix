{ ... }:

{
  # use gnome as display backend
  services.xserver.enable = true;
  services.displayManager.gddm.enable = true;
  services.displayManager.gddm.wayland = true;
  services.desktopManager.gnome.enable = true;
}