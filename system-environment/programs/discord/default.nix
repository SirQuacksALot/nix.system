{ pkgs, ... }: {
  users.users.sebastian.packages = with pkgs; [
    discord
  ];

  programs.noisetorch.enable = true; # noise supression - https://github.com/noisetorch/NoiseTorch
}