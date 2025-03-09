{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-studio-full
    flutterPackages-source.stable
    jdk17
  ];
}