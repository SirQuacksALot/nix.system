{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ 
    kitty # commandline emulator
  ];
}