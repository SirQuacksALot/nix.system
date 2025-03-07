{ pkgs, zen-browser, ... }:

{
  imports = [
    ./modules
    ./services
    ./programs
  ];

  environment.systemPackages = with pkgs; [
    vscode
    zen-browser.packages."x86_64-linux".default
  ];

}