{ pkgs, ... }:

{
  imports = [
    ./modules
    ./services
    ./programs
  ];

  environment.systemPackages = with pkgs; [
    vscode
  ];

}