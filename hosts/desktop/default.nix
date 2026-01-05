{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ../../nixosModules
  ];
  config = {
    gaming.enable = true;
  };
}