{
  description = "My Nixos";

  # Inputs
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgsUnstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:Nixos/nixos-hardware/master";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    nixos-grub-themes.url = "github:jeslie0/nixos-grub-themes";
  };

  # Outputs to flake body
  outputs = { self, nixpkgs, nixos-hardware, nixpkgsUnstable, ... }@inputs: 
  
  let 
    # Base system defintion variables
    system = "x86_64-linux";
    host = "xps13";
    username = "sebastian";
  in 
  {

    nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
      # Global Package Provider definition
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        config.android_sdk.accept_license = true;
        overlays = [
          (final: _: {
            unstable = import nixpkgsUnstable {
              inherit (final.stdenv.hostPlatform) system;
              inherit (final) config;
            };
          })
        ];
      };

      # Arguments to inherit to all modules
      specialArgs = { inherit system inputs username host; };

      # Module import list
      modules = [
        nixos-hardware.nixosModules.dell-xps-13-9315
        ./hosts/${host}/nixos/configuration.nix
      ];

    };

  };
}
