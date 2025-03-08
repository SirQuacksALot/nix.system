{ config, lib, pkgs, ... }: 

#----------------------------------------------------------------
# Waybar module
#
# This is a self meade module to install an configure waybar. It's been heavaly influenced by the following.
# Source: https://github.com/nix-community/home-manager/blob/master/modules/programs/waybar.nix

let
  inherit (lib)
    all filterAttrs hasAttr isStorePath literalExpression optional optionalAttrs
    types;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.modules) mkIf mkMerge;

  cfg = config.waybar;
in
{
  #----------------------------------------------------------------
  # Define Options
  #
  options.waybar = with lib.types; {
    # Should it be enabled ? 
    enable = mkEnableOption "waybar";

    # Package option
    package = mkOption {
      type = package;
      default = pkgs.waybar;
      defaultText = literalExpression "pkgs.waybar";
    };

    # Config content as path or sting '' content ''
    settings = mkOption {
      type = nullOr (either path lines);
      default = null;
    };

    # Css styling as path ort css string '' content ''
    style = mkOption {
      type = nullOr (either path lines);
      default = null;
    };

    # Enable System service
    systemd.enable = mkEnableOption "Waybar systemd integration";

    # Define target fpr system service
    systemd.target = mkOption {
      type = nullOr str;
      default = config.wayland.systemd.target;
      defaultText = literalExpression "config.wayland.systemd.target";
    };
    
    # Enable to inspect obejcts - docs: https://developer.gnome.org/documentation/tools/inspector.html
    systemd.enableInspect = mkOption {
      type = bool;
      default = false;
    };
  };

  config = {
    # Install package
    environment.systemPackages = with pkgs; [
      cfg.package
    ];

    systemd.user.services.waybar = mkIf cfg.systemd.enable{
      Unit = {
        PartOf = [ cfg.systemd.target ];
        After = [ cfg.systemd.target ];
        ConditionEnvironment = "WAYLAND_DISPLAY";
        X-Restart-Triggers = optional (cfg.settings != null)
          "~/.config/waybar/config"
          ++ optional (cfg.style != null)
          "~/.config/waybar/style.css";
      };

      Service = mkIf cfg.systemd.enable{
        ExecStart = "${cfg.package}/bin/waybar";
        ExecReload = "${pkgs.coreutils}/bin/kill -SIGUSR2 $MAINPID";
        Restart = "on-failure";
        KillMode = "mixed";
      } // optionalAttrs cfg.systemd.enableInspect {
        Environment = [ "GTK_DEBUG=interactive" ];

        Install.WantedBy =
          lib.optional (cfg.systemd.target != null) cfg.systemd.target;
      };
    };
  };
}