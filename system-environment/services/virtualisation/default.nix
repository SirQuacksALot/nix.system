{ ... }: {
  virtualisation.libvirtd.enable = false;
  virtualisation.docker.enable = true;
  users.users.sebastian.extraGroups = [ "docker" ];
}