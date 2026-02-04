{ inputs, ... }: {
  flake.nixosModules.networking = { pkgs, ... }: {
    networking.networkmanager.enable = true;
  };
}