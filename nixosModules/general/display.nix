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
      xwayland = true;
    };
    environment.systemPackages = [ pkgs.kitty waybar hyprpaper ];
  };
}
