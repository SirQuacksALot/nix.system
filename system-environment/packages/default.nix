{ pkgs, ... }: 

let
  python-packages = pkgs.python3.withPackages (
    ps: with ps; [
      requests
      pyquery   # needed for weather scripts
    ]
  );
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
  ]) ++  [ python-packages ];
}