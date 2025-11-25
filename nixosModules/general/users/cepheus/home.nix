{ pkgs, home-manager, inputs, ... }: {
  home-manager.users.cepheus = {
    home.username = "cepheus";
    home.homeDirectory = "/home/cepheus";

    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      plugins = with inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}; [
      	hyprexpo
	hyprfocus
	xtra-dispatchers
      ];
      settings = {

      };
    };

    programs.kitty.enable = true;

    home.stateVersion = "25.05";
  };
}
