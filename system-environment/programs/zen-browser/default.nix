{ inputs, pkgs, ... }: {
  users.users.sebastian.packages = with pkgs; [
    inputs.zen-browser.packages."x86_64-linux".specific
  ];
}