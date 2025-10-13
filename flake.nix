{
  description = "System configuration for desktop & laptop";
  
  inputs = {
    nixpkgs-stable = { url = "github:NixOS/nixpkgs/nixos-25.05"; };
    nixpkgs-unstable = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
    nvf.url = "github:notashelf/nvf";
  };
  
  outputs = inputs@{ self, nixpkgs-unstable, nixpkgs-stable, nvf, ... }:
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
	  nvf.nixosModules.default
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
	  nvf.nixosModules.default
        ];
        specialArgs = {
          inherit pkgs-stable;
        };
      };
    };
  };
}
