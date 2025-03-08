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
  jsonFormat = pkgs.format.json {};
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
  };

  config = {
    # Install package
    environment.systemPackages = with pkgs; [
      cfg.package
    ];

    # make config file
    xdg.configFile."waybar/config" = mkIf (cfg.settings != null){
      source = if builtins.isPath cfg.settings || isStorePath cfg.settings then
        cfg.settings
      else 
        pkgs.writeText "waybar/config" cfg.settings;
      onChange = ''
        ${pkgs.procps}/bin/pkill -u $USER -USR2 waybar || true
      '';
    };
    
    # make style file
    xdg.configFile."waybar/style.css" = mkIf (cfg.style != [ ]){
      source = if builtins.isPath cfg.style || isStorePath cfg.style then
        cfg.style
      else 
        pkgs.writeText "waybar/style.css" cfg.style;
      onChange = ''
        ${pkgs.procps}/bin/pkill -u $USER -USR2 waybar || true
      '';
    };
  };
}