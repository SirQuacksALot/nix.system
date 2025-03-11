{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ 
    swaynotificationcenter # notification daemon
  ];
}