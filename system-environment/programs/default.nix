# register nix config - imports all programs defined in thair respectiv files
{ ... }: {
  imports = [
    ./zen-browser
    ./visual-studio-code
    ./spotify
    ./postman
    ./keepassxc
    ./discord
    ./obsidian
    ./whatsapp
    ./telegram
    # ./android-studio
  ];
}