{ pkgs, ... }: 

let
  python-packages = pkgs.python3.withPackages (
    ps: with ps; [
      requests
      pyquery   # needed for weather scripts
      discord
    ]
  );
in
{
  programs.nix-ld.enable = true;
  environment.systemPackages = (with pkgs; [
    clang           # build tools
    curl            # transfaring files with url 
    git             # version control
    killall         # kill all related processes
    nano            # editor
    openssl         # cryptographic library
    pciutils        # pci inspection and manipulation
    wget            # retrive files via https, http and ftp
    python314       # python programming language
    fastfetch       # cli system info fetcher
    zoom-us         # video conference
    teams-for-linux # teams
    gradle
    act
    eduvpn-client   # HSMW vpn Client
    php
    libreoffice     # Office suite - for now
    unzip
  ]) ++  
  [ 
    python-packages
  ];
}