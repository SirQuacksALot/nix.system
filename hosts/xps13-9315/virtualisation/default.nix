{ ... }:

{
  virtualisation.docker.enable = true;
  users.users.sebastian.extraGroups = [ "docker" ];
}