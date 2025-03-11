{ pkgs, username, ... }: 
let
  inherit (import ../../default.nix) hyprconfig;
in
{
  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = username;
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland --config ${hyprconfig}"; # start Hyprland with a TUI login manager - change to service run. so other programs can a dependent service too
      };
    };
  };
}

# storpath functio to define the storepath - https://nix.dev/manual/nix/2.18/language/builtins#builtins-storePath