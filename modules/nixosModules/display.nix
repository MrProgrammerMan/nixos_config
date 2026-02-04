{ inputs, ... }: {
  flake.nixosModules.display = { pkgs, ... }: {
    services.xserver.enable = true;
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.xserver.xkb = {
      layout = "no";
      variant = "";
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    
    environment.systemPackages = with pkgs; [ kitty ];
    environment.variables.NIXOS_OZONE_WL=1;
  };
}
