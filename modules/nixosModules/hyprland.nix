{ ... }: {
  flake.nixosModules.hyprland = { pkgs, ... }: {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    
    environment.systemPackages = with pkgs; [ kitty ];
    environment.variables.NIXOS_OZONE_WL=1;
  };
}
