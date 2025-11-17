{ pkgs, home-manager, hyprland, hyprland-plugins, ... }: {
  home-manager.users.cepheus = {
    home.username = "cepheus";
    home.homeDirectory = "/home/cepheus";

    wayland.windowManager.hyprland = {
      enable = true;
      package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      plugins = with hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}; [
      
      ];
      settings = {

      };
    };

    home.stateVersion = "25.05";
  };
}
