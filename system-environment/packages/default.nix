{ pkgs, ... }: 

let
  python-packages = pkgs.python3.withPackages (
    ps: with ps; [
      requests
      pyquery   # needed for weather scripts
    ]
  );

  buildToolsVersion = "34.0.0";
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    buildToolsVersions = [ buildToolsVersion "28.0.3" ];
    platformVersions = [ "34" "28" ];
    abiVersions = [ "armeabi-v7a" "arm64-v8a" ];
  };
  androidSdk = androidComposition.androidsdk;
in
{
  environment.systemPackages = (with pkgs; [
    clang         # build tools
    curl          # transfaring files with url 
    git           # version control
    killall       # kill all related processes
    nano          # editor
    openssl       # cryptographic library
    pciutils      # pci inspection and manipulation
    wget          # retrive files via https, http and ftp
    python314     # python programming language
    fastfetch     # cli system info fetcher
    # unstable.warp-terminal # currently bugged - wayland support does not work on this system dunno why ´\_(°.°)_/`

    flutter
    androidSdk # The customized SDK that we've made above
    jdk17
  ]) ++  
  [ 
    python-packages
  ];

  environment.sessionVariables.ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
}