inputs@{ pkgs, home-manager, ... }: {
  home-manager.users.cepheus = {
    home.username = "cepheus";
    home.homeDirectory = "/home/cepheus";

    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      plugins = with inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}; [
      
      ];
      settings = {

      };
    };

    home.stateVersion = "25.05";
  };
}
