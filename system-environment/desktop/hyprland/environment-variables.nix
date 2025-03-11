{ ... }: {
  # For Electron apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}