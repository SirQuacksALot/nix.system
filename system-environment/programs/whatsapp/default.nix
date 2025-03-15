{ pkgs, ... }: {
  users.users.sebastian.packages = with pkgs; [
    whatsapp-for-linux
  ];
}