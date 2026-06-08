{ ... }: {
  flake.nixosModules.noisetorch = { pkgs, ... }: {
    programs.noisetorch = {
      enable = true;
    };
  };
}
