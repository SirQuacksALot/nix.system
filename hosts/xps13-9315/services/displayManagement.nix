{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ 
    libsecret
    polkit
    polkit_gnome
  ];

  # use gnome as display backend
  services.xserver.enable = true;
  services.xserver.displayManager.defaultSession = "hyprland";
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true; # load gnome-keyring at startup
  environment.variables.XDG_RUNTIME_DIR = "/run/user/$UID"; # set the runtime directory
  programs.seahorse.enable = true; # enable the graphical frontend for managing


  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
}