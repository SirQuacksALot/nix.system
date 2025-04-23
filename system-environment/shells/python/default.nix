{ pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    (python3.withPackages(p: with p; [
      # packages have to be in nix pkgs
      requests
      pyquery
      discordpy
    ]))
  ];
}