{ inputs, ... }: {
  flake.nixosModules.graphics = { pkgs, ... }: {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}