{ pkgs, home-manager, inputs, system, ... }: {
  home-manager.users.cepheus = {
    home.username = "cepheus";
    home.homeDirectory = "/home/cepheus";

    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      plugins = with inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}; [
      
      ];
      settings = {

      };
    };

    home.stateVersion = "25.05";
  };
}
