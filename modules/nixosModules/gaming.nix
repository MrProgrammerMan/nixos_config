{ ... }: {
  flake.nixosModules.gaming = { ... }: {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
    programs.gamemode.enable = true;
    hardware.xone.enable = true;
  };
}