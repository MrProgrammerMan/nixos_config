{
  description = "System configuration for desktop & laptop";
  
  inputs = {
    nixpkgs-stable = { url = "github:NixOS/nixpkgs/nixos-25.05"; };
    nixpkgs-unstable = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
  };
  
  outputs = inputs@{ self, nixpkgs-unstable, nixpkgs-stable, ... }: {
    nixosConfigurations = {
      nixos-desktop = nixpkgs-unstable.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  ./common.nix
	  ./hardware-specific-desktop.nix
	  ./hardware-configuration-desktop.nix
	];
	specialArgs = {
	  nixpkgs-stable = nixpkgs-stable.legacyPackages.x86_64-linux;
	};
      };

      nixos-laptop = nixpkgs-unstable.lib.nixosSystem {
	system = "x86_64-linux";
	modules = [
	  ./common.nix
	  ./hardware-specific-laptop.nix
	  ./hardware-configuration-laptop.nix
	];
	specialArgs = {
	  nixpkgs-stable = nixpkgs-stable.legacyPackages.x86_64-linux;
	};
      };
    };
  };
}
