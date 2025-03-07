{ pkgs, ... }:

{
  # Docs: https://wiki.nixos.org/wiki/Hyprland

  environment.systemPackages = with pkgs; [
    waybar
    swww
    kitty
  ];

  programs.hyprland.enable = true;

  environment.sessionVariables = rec {
    EDITOR = "vscode";
    BROWSER = "zen";
    TERMINAL = "kitty";
  };
}