{
  description = "System configuration for desktop & laptop";
  
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
    nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = inputs@{ self, nixpkgs, nvf, home-manager, ... }:
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
        modules = [
          ./hosts/desktop
	  nvf.nixosModules.default
	  home-manager.nixosModules.default
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [
          ./hosts/laptop
	  nvf.nixosModules.default
	  home-manager.nixosModules.default
        ];
      };
    };
  };
}
