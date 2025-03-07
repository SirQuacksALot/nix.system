{ pkgs, ... }:

{
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  environment.systemPackages = with pkgs; [
    networkmanagerapplet # gnome applet for interfacing with networkmanager
  ];
}