{ config, lib, pkgs, ... }: 
let
  cfg = config.hyprGreetd;
in
{
  options.hyprGreetd = {
    enable = lib.mkEnableOption "enable hypr greetd";
    username = lib.mkOption {
      defualt = "seb";
    };
    hyprconfig = lib.mkOption {
      default = "~/.config/hypr/hyprland.config";
    };
  };

  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;
      vt = 3;
      settings = {
        default_session = {
          user = cfg.username;
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland --config ${cfg.hyprconfig}"; # start Hyprland with a TUI login manager - change to service run. so other programs can a dependent service too
        };
      };
    };
  };
}

# storpath functio to define the storepath - https://nix.dev/manual/nix/2.18/language/builtins#builtins-storePath
# toFile states its referencing it self - https://nix.dev/manual/nix/2.18/language/builtins#builtins-toFile