# register nix config - imports all services defined in thair respectiv files
{ ... }: {
  imports = [
    ./bootloader
    ./appimage
    ./bluetooth
    ./audio
    ./networking
    ./virtualisation
    ./touchpad
    ./remote
    ./garbage-collection
    ./power
  ];
}