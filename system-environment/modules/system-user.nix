{ lib, config, pkgs, ... }:

let
  cfg = config.system-user;
in
{
  options.system-user = {
    enable = lib.mkEnableOption "enable user module";
    username = lib.mkOption {
      default = "seb";
    };
  };
  
  config = lib.mkIf cfg.enable{
    # Define a system user
    users.groups.nixos-manage = {};
    users.users.${cfg.username} = {
      # Generalisations
      description = "${cfg.username}";

      # Specifications
      isNormalUser = true;
      initialPassword = "123";
      extraGroups = [ "wheel" "docker" "networkmanager" "libvirtd" "scanner" "lp" "audio" "input" "video" ];

      # Personalisations
      shell = pkgs.zsh;
      home = "/home/${cfg.username}";
      packages = with pkgs; [
        # ...
      ];
    };

    # Enable zsh - used as default shell
    programs.zsh = {
      enable = true;

      enableCompletion = true;

      ohMyZsh.enable = true;
      ohMyZsh.plugins = [ "git" "sudo" "docker" ];
      ohMyZsh.theme = "agnoster";

      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      promptInit = ''
        # Set-up icons for files/folders in terminal using lsd
        alias ls='lsd'
        alias l='ls -l'
        alias la='ls -a'
        alias lla='ls -la'
        alias lt='ls --tree'

        source <(fzf --zsh);
        HISTFILE=~/.zsh_history;
        HISTSIZE=10000;
        SAVEHIST=10000;
        setopt appendhistory;
      '';
    };
    
  };
}
