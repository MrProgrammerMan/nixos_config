{ pkgs, ... }: {
  config = {
    services.xserver.enable = true;
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.xserver.xkb = {
      layout = "no";
      variant = "nodeadkeys";
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    environment.systemPackages = with pkgs; [ kitty ];
  };
}
