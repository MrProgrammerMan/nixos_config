{
  description = "System configuration for desktop & laptop";
  
  inputs = {
    nixpkgs-stable = { url = "github:NixOS/nixpkgs/nixos-25.05"; };
    nixpkgs-unstable = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
  };
  
  outputs = inputs@{ self, nixpkgs-unstable, nixpkgs-stable, ... }:
  let
    system = "x86_64-linux";
    
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config = { allowUnfree = true; };
    };

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config = { allowUnfree = true; };
    }; 
  in {
    nixosConfigurations = {
      nixos-desktop = nixpkgs-unstable.lib.nixosSystem {
        system = system;
        pkgs = pkgs-unstable;
        modules = [
          ./common.nix
          ./hardware-specific-desktop.nix
          ./hardware-configuration-desktop.nix
        ];
        specialArgs = {
          inherit pkgs-stable;
        };
      };

      nixos-laptop = nixpkgs-unstable.lib.nixosSystem {
        system = system;
        pkgs = pkgs-unstable;
        modules = [
          ./common.nix
          ./hardware-specific-laptop.nix
          ./hardware-configuration-laptop.nix
        ];
        specialArgs = {
          inherit pkgs-stable;
        };
      };
    };
  };
}
