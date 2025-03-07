{ pkgs, zen-browser, ... }:

{
  imports = [
    ./modules
    ./services
    ./programs
  ];

  users.users.sebastian.packages = with pkgs; [
    libsecret
    vscode
    zen-browser.packages."x86_64-linux".default
  ];

  environment.systemPackages = with pkgs; [
  ];

}