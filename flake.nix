{
  description = "System configuration for desktop & laptop";
  
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
    nvf.url = "github:notashelf/nvf";
  };
  
  outputs = inputs@{ self, nixpkgs, nvf, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs-unstable {
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
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [
          ./hosts/laptop
	  nvf.nixosModules.default
        ];
      };
    };
  };
}
