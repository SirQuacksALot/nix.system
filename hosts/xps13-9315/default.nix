{ pkgs, zen-browser, ... }:

{
  imports = [
    ./modules
    ./services
    ./programs
    ./fonts
    ./virtualisation
  ];

  users.users.sebastian.packages = with pkgs; [
    keepassxc
    postman
    discord
    docker-compose
    vscode
    zen-browser.packages."x86_64-linux".default
  ];

  environment.systemPackages = with pkgs; [

  ];

}