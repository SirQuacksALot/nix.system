{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  inputs.nixos-hardware.url = "github:Nixos/nixos-hardware/master";
  inputs.zen-browser.url = "github:MarceColl/zen-browser-flake";
  inputs.android-nixpkgs.url = "github:tadfisher/android-nixpkgs";

  outputs = { self, nixpkgs, nixos-hardware, zen-browser, android-nixpkgs, ... }@attrs: {

    nixosConfigurations.xps13-9315 = nixpkgs.lib.nixosSystem {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
        config.android_sdk.accept_license = true;
      };

      specialArgs = { inherit zen-browser android-nixpkgs; };

      modules = [
        nixos-hardware.nixosModules.dell-xps-13-9315
        ./nixos/configuration.nix
        ./hosts/xps13-9315
      ];
    };
  };
}
