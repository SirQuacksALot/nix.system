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

  waybar.enable = true;
  # waybar.runParams = "-c ~/.config/waybar/config -s ~/.config/waybar/style.css";
  waybar.systemd.enable = true;

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.withUWSM = true; # enable to have clean system service driven session

  environment.sessionVariables = rec {
    EDITOR = "vscode";
    BROWSER = "zen";
    TERMINAL = "kitty";
    NIXOS_OZONE_WL = "1"; # Optional, hint Electron apps to use Wayland:
  };
}