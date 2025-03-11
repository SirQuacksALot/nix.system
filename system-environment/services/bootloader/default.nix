{ host, ... }: {
  boot = {
    loader.grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      gfxmodeBios = "auto";
      memtest86.enable = true;
      extraGrubInstallArgs = [ "--bootloader-id=${host}" ];
      configurationName = "${host}";
  	};

    plymouth.enable = true; # plymouth loading overlay - may cause issues with graphics driver loading and displayLink driver

  };

  distro-grub-themes = {
    enable = true;
    theme = "nixos";
  };
}