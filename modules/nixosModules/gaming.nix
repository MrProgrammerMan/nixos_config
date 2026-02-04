{ inputs, ... }: {
  flake.nixosModules.gaming = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;
    users.users.cepheus.packages = with pkgs; [
      prismlauncher
    ];
  }
  
}