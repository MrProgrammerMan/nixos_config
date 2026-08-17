{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;

      settings = {
        spawn-at-startup = [
          [ (lib.getExe self'.packages.myNoctalia) ]
          [ "gnome-keyring-daemon" "--start" "--components=secrets,pkcs11,ssh" ]
          [ "/run/current-system/sw/libexec/polkit-gnome-authentication-agent-1" ]
          [ "nm-applet" ]
        ];

        cursor = {
          xcursor-theme = "Bibata-Modern-Ice";
          xcursor-size = 24;
        };

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
        
        extraConfig = ''
          input {
              keyboard {
                  xkb {
                      layout "no"
                  }
              }
              touchpad {
                  tap
                  dwt
                  drag true
                  natural-scroll
                  click-method "clickfinger"
              }
          }
        '';

        layout.gaps = 5;

        binds = {
          "Mod+Space".spawn-sh = "${lib.getExe self'.packages.myNoctalia} msg panel-toggle launcher";
          "Mod+Return".spawn = [ (lib.getExe pkgs.kitty) ];

          "Mod+Q".close-window = _: { };
          "Mod+M".maximize-column = _: { };
          "Mod+F".fullscreen-window = _: { };
          "Mod+C".center-column = _: { };

          "Mod+H".focus-column-left = _: { };
          "Mod+L".focus-column-right = _: { };
          "Mod+K".focus-window-up = _: { };
          "Mod+J".focus-window-down = _: { };

          "Mod+Left".focus-column-left = _: { };
          "Mod+Right".focus-column-right = _: { };
          "Mod+Up".focus-window-up = _: { };
          "Mod+Down".focus-window-down = _: { };

          "Mod+Shift+H".move-column-left = _: { };
          "Mod+Shift+L".move-column-right = _: { };
          "Mod+Shift+K".move-window-up = _: { };
          "Mod+Shift+J".move-window-down = _: { };

          "Mod+1".focus-workspace = "w0";
          "Mod+2".focus-workspace = "w1";
          "Mod+3".focus-workspace = "w2";
          "Mod+4".focus-workspace = "w3";
          "Mod+5".focus-workspace = "w4";
          "Mod+6".focus-workspace = "w5";
          "Mod+7".focus-workspace = "w6";
          "Mod+8".focus-workspace = "w7";
          "Mod+9".focus-workspace = "w8";
          "Mod+0".focus-workspace = "w9";

          "Mod+Shift+1".move-column-to-workspace = "w0";
          "Mod+Shift+2".move-column-to-workspace = "w1";
          "Mod+Shift+3".move-column-to-workspace = "w2";
          "Mod+Shift+4".move-column-to-workspace = "w3";
          "Mod+Shift+5".move-column-to-workspace = "w4";
          "Mod+Shift+6".move-column-to-workspace = "w5";
          "Mod+Shift+7".move-column-to-workspace = "w6";
          "Mod+Shift+8".move-column-to-workspace = "w7";
          "Mod+Shift+9".move-column-to-workspace = "w8";
          "Mod+Shift+0".move-column-to-workspace = "w9";

          "XF86AudioRaiseVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";
          "XF86AudioMute".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

          "Mod+Ctrl+H".set-column-width = "-5%";
          "Mod+Ctrl+L".set-column-width = "+5%";
          "Mod+Ctrl+J".set-window-height = "-5%";
          "Mod+Ctrl+K".set-window-height = "+5%";

          "Mod+WheelScrollLeft".focus-column-left = _: { };
          "Mod+WheelScrollRight".focus-column-right = _: { };
          "Mod+WheelScrollDown".focus-workspace-down = _: { };
          "Mod+WheelScrollUp".focus-workspace-up = _: { };

          "Mod+Ctrl+S".spawn-sh = ''${lib.getExe pkgs.grim} -l 0 - | ${pkgs.wl-clipboard}/bin/wl-copy'';

          "Mod+Shift+S".spawn-sh = lib.getExe (pkgs.writeShellApplication {
            name = "screenshot";
            text = ''
              ${lib.getExe pkgs.grim} -g "$(${lib.getExe pkgs.slurp} -w 0)" - \
              | ${pkgs.wl-clipboard}/bin/wl-copy
            '';
          });

          "Print".spawn-sh = lib.getExe (pkgs.writeShellApplication {
            name = "screenshot-full";
            text = ''
              ${lib.getExe pkgs.grim} - | ${pkgs.wl-clipboard}/bin/wl-copy
            '';
          });
        };
      };
    };
  };
}