{ inputs, system, ... }:

{
  imports = [
    ./modules
    ./services
    ./programs
  ];

  environment.systemPackages = with pkgs; [
    vscode
    inputs.zen-browser.packages."${system}".specific
  ];

}