{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ 
    swww # wallpaper daemon
  ];
}