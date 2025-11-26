{ home-manager, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    users.cepheus = import ./cepheus.nix;
    users.carro = import ./carro.nix;
  };
}
