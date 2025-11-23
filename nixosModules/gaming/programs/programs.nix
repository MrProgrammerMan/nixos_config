{ lib, config, pkgs, ... }: {
  options = {
    gaming.programs.enable = lib.mkEnableOption "enables gaming programs";
  };
  config = lib.mkIf config.gaming.programs.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;
    user.users.cepheus.packages = with pkgs; [
      prismlauncher
    ];
  };
}
