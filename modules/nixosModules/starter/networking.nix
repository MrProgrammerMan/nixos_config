{ ... }: {
  flake.nixosModules.networking = { pkgs, ... }: {
    networking = {
      networkmanager = {
        enable = true;
        plugins = [ pkgs.networkmanager-openvpn ];
      };
      firewall = {
        checkReversePath = "loose";
        allowedUDPPorts = [ 51820 ];
      };
    };
  };
}