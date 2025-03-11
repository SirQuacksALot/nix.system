{ pkgs, username, ... }: 
let
  inherit (import ../../../default.nix) config;
in
{
  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = username;
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland --config ${config}"; # start Hyprland with a TUI login manager - change to service run. so other programs can a dependent service too
      };
    };
  };
}