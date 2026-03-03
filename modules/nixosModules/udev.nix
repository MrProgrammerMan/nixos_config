{ ... }: {
  flake.nixosModules.udev = { pkgs, ... }: {
    services.udev.packages = [ pkgs.libu2f-host ]; # enable security keys
  };
}
