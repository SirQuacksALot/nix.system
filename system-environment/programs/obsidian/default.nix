{ pkgs, ... }: {
  users.users.sebastian.packages = with pkgs; [
    obsidian
  ];
}