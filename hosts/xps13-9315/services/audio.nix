{ lib, pkgs, ... }:

{
  services.pipewire.enable = lib.mkForce false;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    configFile = pkgs.writeText "default.pa" ''
      load-module module-bluetooth-policy
      load-module module-bluetooth-discover
      ## module fails to load with 
      ##   module-bluez5-device.c: Failed to get device path from module arguments
      ##   module.c: Failed to load module "module-bluez5-device" (argument: ""): initialization failed.
      # load-module module-bluez5-device
      # load-module module-bluez5-discover
    '';
    
  };

  hardware.bluetooth.settings = {
    General = {
		  Experimental = true;
      Enable = "Source,Sink,Media,Socket";
    };
  };

  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  }; 
}