{ ... }: {
  flake.nixosModules.gaming = { ... }: {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;
  };
}