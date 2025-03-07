# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../hosts/xps13-9315
  ];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  default-user.enable = true;
  default-user.username = "sebastian";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.sebastian = {
  #  isNormalUser = true;
  #  extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #  packages = with pkgs; [
  #    tree
  #  ];
  #};

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nano
    git
    wget
  ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

