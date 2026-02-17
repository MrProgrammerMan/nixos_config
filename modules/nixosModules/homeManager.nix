{ inputs, ... }: {
  flake.nixosModules.homeManager = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    home-manager.users.cepheus = import ./homeManagerModules/cepheus.nix;
    home-manager.users.carro = import ./homeManagerModules/carro.nix;
  };
}