{ pkgs, ... }: {
  config = {
    services.xserver.enable = true;
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.xserver.xkb = {
      layout = "no";
      variant = "";
      extraLayouts.acute = {
        description = "F13 as Nordic dead acute";
        languages = [ "se" ];
        symbolsFile = ./xkb_f13.txt;
      };
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    environment.systemPackages = with pkgs; [ kitty ];
    environment.variables.NIXOS_OZONE_WL=1;
  };
}
