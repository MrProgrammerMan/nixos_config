{ ... }: {
  flake.nixosModules.gns3-server = { ... }: {
    services.gns3-server.enable = true;
  };
}