{ pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    (python3.withPackages(p: with p; [
      requests
      pyquery
      discordpy
    ]))
  ];
}