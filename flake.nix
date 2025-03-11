{
  description = "My Nixos";

  # Inputs
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  inputs.nixos-hardware.url = "github:Nixos/nixos-hardware/master";
  inputs.zen-browser.url = "github:MarceColl/zen-browser-flake";

  # Outputs to flake body
  outputs = { self, nixpkgs, nixos-hardware, ... }@attrs: 
  
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
