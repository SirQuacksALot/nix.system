{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

  outputs = { self, nixpkgs }@attrs: {
    nixosConfigurations.xps13-9315 = nixpkgs.lib.nixosSystem {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      modules = [
        ./nixos/configuration.nix
      ];
    };
  };
}
