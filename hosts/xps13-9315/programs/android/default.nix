{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-studio
    android-tools
    android-studio-tools
    flutter
    dart
    flutterPackages-source.stable
    jdk17
    adb-sync
    google-chrome
  ];

  environment.sessionVariables = {
    CHROME_EXECUTABLE = pkgs.google-chrome.meta.mainProgram;
    ANDROID_HOME = "${pkgs.android-tools}/bin";
  };

  programs.adb.enable = true;
  users.users.sebastian.extraGroups = ["adbusers" "kvm"]; # kvm might not work - trys to help with hardware acceleration for emulator - docs related ref.: https://github.com/NixOS/nixpkgs/issues/41703

  services.udev.packages = [
    pkgs.android-udev-rules
  ];
}