{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-studio
    flutterPackages-source.stable
    jdk17
  ];
}