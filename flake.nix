{
  description = "System configuration for desktop & laptop";
  
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
    nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };
  
  outputs = inputs@{ self, nixpkgs, nvf, home-manager, hyprland, hyprland-plugins, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
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
	  home-manager.nixosModules.default
	  hyprland.nixosModules.default
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
	  home-manager.nixosModules.default
	  hyprland.nixosModules.default
        ];
      };
    };
  };
}
