{
  description = "System configuration for desktop & laptop";
  
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
    nixpkgs-stable = { url = "github:NixOS/nixpkgs/nixos-25.11"; };
    nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = inputs@{ self, nixpkgs, nixpkgs-stable, nvf, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };
    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config = { allowUnfree = true; };
    };
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
	specialArgs = {
	  inherit inputs;
	};
        modules = [
          ./hosts/desktop
	  nvf.nixosModules.default
	  home-manager.nixosModules.home-manager
	  ./users/home.nix
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
	specialArgs = {
	  inherit inputs;
	};
        modules = [
          ./hosts/laptop
	  nvf.nixosModules.default
	  home-manager.nixosModules.home-manager
	  ./users/home.nix
        ];
      };
    };
  };
}
