{
  description = "My Nixos";

  # Inputs
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgsUnstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:Nixos/nixos-hardware/master";
    zen-browser.url = "github:pneumaea/zen-browser-flake";
    nixos-grub-themes.url = "github:jeslie0/nixos-grub-themes";
    flutter-nix.url = "github:maximoffua/flutter.nix/3.19.0"; 
  };

  # Outputs to flake body
  outputs = { self, nixpkgs, nixos-hardware, nixpkgsUnstable, flake-utils, flutter-nix, ... }@inputs: 
  
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
          flutter-nix.overlays.default
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
