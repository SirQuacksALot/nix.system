{ pkgs, ... }: {
  users.users.sebastian.packages = with pkgs; [
    telegram-desktop
  ];
}