{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  inputs.zen-browser.url = "github:0xc000022070/zen-browser-flake";
  inputs.nixos-hardware.url = "github:Nixos/nixos-hardware/master";

  outputs = { self, nixpkgs, nixos-hardware, ... }@attrs: {
    nixosConfigurations.xps13-9315 = nixpkgs.lib.nixosSystem {
      inherit inputs;
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      modules = [
        nixos-hardware.nixosModules.dell-xps-13-9315
        ./nixos/configuration.nix
        ./hosts/xps13-9315
      ];
    };
  };
}
