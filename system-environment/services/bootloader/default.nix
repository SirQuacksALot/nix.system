{ host, pkgs, inputs, ... }: {
  boot = {
    # loader.grub = {
    #   enable = true;
    #   devices = [ "nodev" ];
    #   efiSupport = true;
    #   gfxmodeBios = "auto";
    #   memtest86.enable = true;
    #   extraGrubInstallArgs = [ "--bootloader-id=${host}" ];
    #   configurationName = "${host}";
    #   theme = inputs.nixos-grub-themes.packages.${pkgs.system}.nixos;
  	# };

    # plymouth.enable = true; # plymouth loading overlay - may cause issues with graphics driver loading and displayLink driver

    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
}