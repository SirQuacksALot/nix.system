{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ 
    rofi-wayland # window switcher, run dialog and dmenu for wayland 
  ];
}