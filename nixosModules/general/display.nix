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
        symbolsFile = ''
          xkb_symbols "f13_acute" {
            key <FK13> {
              type[Group1] = "TWO_LEVEL",
              symbols[Group1] = [ ISO_Level3_Shift equal ]
            };
          };
        '';
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
