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
      ];
      settings = {
      # -----------------------
      #   GENERAL SETTINGS
      # -----------------------
      "$mod" = "SUPER";

      monitor = [
        # Adjust to your monitor name (check with: hyprctl monitors)
        "eDP-1, preferred, auto, 1"
      ];

      exec-once = [
        "waybar"
        "nm-applet"
        "blueman-applet"
        "swww init"
      ];

      # -----------------------
      #   INPUT
      # -----------------------
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };

      # -----------------------
      #   DECORATION
      # -----------------------
      decoration = {
        rounding = 8;
        blur = {
          enabled = false;
        };
        shadow_offset = "0 5";
        "col.shadow" = "rgba(00000099)";
      };

      # disable animations (easier for beginners)
      animations.enabled = false;

      # -----------------------
      #   GENERAL BEHAVIOR
      # -----------------------
      general = {
        border_size = 2;
        resize_on_border = true;
        gaps_in = 5;
        gaps_out = 10;
      };

      # -----------------------
      #   KEYBINDS
      # -----------------------
      bind = [
        # Applications
        "$mod, RETURN, exec, alacritty"
        "$mod, Q, killactive"
        "$mod SHIFT, E, exit"
        "$mod, D, exec, wofi --show drun"

        # Window movement
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        # Layout / toggles
        "$mod, F, fullscreen"
        "$mod SHIFT, space, togglefloating"

        # Workspaces (1–9)
        "$mod ALT, 1, workspace, 1"
        "$mod ALT, 2, workspace, 2"
        "$mod ALT, 3, workspace, 3"
        "$mod ALT, 4, workspace, 4"
        "$mod ALT, 5, workspace, 5"
      ];

      # -----------------------
      #   MOUSE BINDS
      # -----------------------
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
    };
    };

    programs.kitty.enable = true;

    home.stateVersion = "25.05";
  };
}
