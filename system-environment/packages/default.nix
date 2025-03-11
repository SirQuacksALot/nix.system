{ pkgs, ... }: {
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
  ]) ++  [ python-packages ];
}