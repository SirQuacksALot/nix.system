{ pkgs, ... }: {
  users.users.sebastian.packages = with pkgs; [
    spotify
  ];
}