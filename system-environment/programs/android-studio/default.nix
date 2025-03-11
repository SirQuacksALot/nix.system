{ pkgs, ... }: {
  users.users.sebastian.packages = with pkgs; [
    android-studio
  ];
}