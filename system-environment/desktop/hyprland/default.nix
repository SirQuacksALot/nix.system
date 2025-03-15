{ pkgs, username, ... }: 
let
  inherit (import ./configs/hyprland.nix) config;
  hyprland_config = builtins.toFile "hyprland.conf" config;
in
{
  imports = [
    ./environment-variables.nix
    ./drivers
    ./services
    ./programs
    ./packages
  ];

  programs.hyprland = {
    enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland; # xdph none git
    xwayland.enable = true;
  };

  hyprGreetd = {
    enable = true;
    username = username;
    hyprconfig = hyprland_config;
  };
}