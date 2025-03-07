{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-hardware.url = "github:Nixos/nixos-hardware/master";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  }

  outputs = { self, nixpkgs, nixos-hardware, ... }@attrs: {

    nixosConfigurations.xps13-9315 = nixpkgs.lib.nixosSystem {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };

      __module.args = { inherit inputs; };

      modules = [
        nixos-hardware.nixosModules.dell-xps-13-9315
        ./nixos/configuration.nix
        ./hosts/xps13-9315
      ];
    };
  };
}
