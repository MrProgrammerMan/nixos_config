{ pkgs, home-manager, ... }: {
  home-manager.users.cepheus = {
    home.username = "cepheus";
    home.homeDirectory = "/home/cepheus";

    wayland.windowManager.hyprland = {
      enable = true;
      plugins = with pkgs.hyprlandPlugins; [
      
      ];
      settings = {

      };
    };

    home.stateVersion = "25.05";
  };
}
