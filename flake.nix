{
  description = "System configuration for desktop & laptop";
  
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-25.05"; };
  };
  
  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations = {
      nixos-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  ./common.nix
	  ./hardware-specific-desktop.nix
	  ./hardware-configuration-desktop.nix
	];
      };

      nixos-laptop = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	modules = [
	  ./common.nix
	  ./hardware-specific-laptop.nix
	  ./hardware-configuration-laptop.nix
	];
      };
    };
  };
}
