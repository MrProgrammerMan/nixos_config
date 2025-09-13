{
  description = "System configuration for desktop & laptop";
  
  inputs = {
    nixpkgs-stable = { url = "github:NixOS/nixpkgs/nixos-25.05"; };
    nixpkgs-unstable = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
  };
  
  outputs = inputs@{ self, nixpkgs-stable, nixpkgs-unstable ... }: {
    nixosConfigurations = {
      nixos-desktop = nixpkgs-unstable.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  ./common.nix
	  ./hardware-specific-desktop.nix
	  ./hardware-configuration-desktop.nix
	];
	specialArgs = {
	  inherit nixpkgs-stable;
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
	  inherit nixpkgs-stable;
	};
      };
    };
  };
}
