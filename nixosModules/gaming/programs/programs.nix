{
  config = {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      package = pkgs-stable.steam;
    };
    programs.gamemode.enable = true;
  };
}