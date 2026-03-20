{ ... }: {
  flake.homeModules.eduvpn = { pkgs, ... }: {
    home.packages = with pkgs; [
      eduvpn-client
    ];
  };
}