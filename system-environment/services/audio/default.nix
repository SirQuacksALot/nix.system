{ pkgs, ... }: {
  services.pipewire.enable = true;

  hardware.bluetooth.settings = {
    General = {
		  Experimental = true;
      Enable = "Source,Sink,Media,Socket";
    };
  };

  # Media controll interface for bluetooth devices - stop, pause ... controll
  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  }; 

  environment.systemPackages = with pkgs; [
    pavucontrol
  ];
}