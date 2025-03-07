{ pkgs, ... }:

{
  # Docs: https://wiki.nixos.org/wiki/Hyprland

  environment.systemPackages = with pkgs; [
    waybar
    swww
    kitty
    dunst
    rofi
  ];

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  environment.sessionVariables = rec {
    EDITOR = "vscode";
    BROWSER = "zen";
    TERMINAL = "kitty";
    NIXOS_OZONE_WL = "1"; # Optional, hint Electron apps to use Wayland:
  };
}