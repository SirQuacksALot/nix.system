{ lib, config, pkgs, ... }:

let
  cfg = config.default-user;
in
{
  options.default-user = {
    enable = lib.mkEnableOption "enable user module";
    username = lib.mkOption {
      default = "sebastian";
      description = "username";
    };
  };
  
  config = lib.mkIf cfg.enable{
    # Enable zsh - used as default shell
    programs.zsh = {
      enable = true;
      autosuggestions.enable = true;
      ohMyZsh.enable = true;
      ohMyZsh.plugins = [ "git" "sudo" "docker" "kubectl" ];
      ohMyZsh.theme = "robbyrussell";
      syntaxHighlighting.enable = true;
      plugins = [
        {
          name = "powerlevel10k-config";
          src = ./p10k;
          file = "p10k.zsh";
        }
        {
          name = "zsh-powerlevel10k";
          src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
          file = "powerlevel10k.zsh-theme";
        }
      ];
    };
    
    # create user
    users.groups.nixos-manage = {};
    users.users.${cfg.username} = {
      isNormalUser = true;
      initialPassword = "123";
      description = "${cfg.username}";
      shell = pkgs.zsh;
      extraGroups = [ "wheel" "docker" "nixos-manage" ];
      home = "/home/${cfg.username}";
      packages = with pkgs; [
        tree
      ];
    };
  };
}
