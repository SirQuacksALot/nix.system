{ pkgs, lib, ... }: {
  programs.waybar.enable = true;

  # override whole unit to compleatly redefine it - https://discourse.nixos.org/t/disable-a-systemd-service-while-having-it-in-nixoss-conf/12732/3 shows your not able to over write just one attribute
  # systemd.user.services.waybar.unitConfig = lib.mkForce [];
  # systemd.user.services.waybar.serviceConfig = lib.mkForce [];
  # systemd.user.services.waybar.wantedBy = lib.mkForce [];
  
  # overrides
  # systemd.user.services.waybar = {
  #   serviceConfig = {
  #     ExecStart="";
  #     ExecReload="kill -SIGUSR2 $MAINPID";
  #     Restart="on-failure";
  #   };
  # };
}