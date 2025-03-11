{ ... }: {
  imports = [
    ./environment-variables.nix
    ./drivers
    ./services
    ./programs
  ];

  programs.hyprland = {
    enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland; # xdph none git
    xwayland.enable = true;
  };
}