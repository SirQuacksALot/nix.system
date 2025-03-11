{ pkgs, android-nixpkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-studio
    android-tools
    android-studio-tools
    flutter
    dart
    jdk17
    google-chrome
  ];

  environment.sessionVariables = {
    CHROME_EXECUTABLE = pkgs.google-chrome.meta.mainProgram;
    ANDROID_HOME = "/home/sebastian/Android/Sdk";
    ANDROID_SDK_ROOT = "/nix/store/d609s6i3j3s7y9zi0p3193v7ywnns9la-android-sdk-platforms-34/libexec/android-sdk";
  };

  programs.adb.enable = true;
  users.users.sebastian.extraGroups = ["adbusers" "kvm"]; # kvm might not work - trys to help with hardware acceleration for emulator - docs related ref.: https://github.com/NixOS/nixpkgs/issues/41703

  services.udev.packages = [
    pkgs.android-udev-rules
  ];
}