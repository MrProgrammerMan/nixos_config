{ home-manager, pkgs, config, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    users.cepheus = import ./cepheus.nix;
    users.carro = import ./carro.nix;
  };
}
