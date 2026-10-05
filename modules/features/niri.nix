{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem = { pkgs, lib, self', config, ... }: {
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
          xcursor-size = 12;
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
          "Mod+Space".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
          "Mod+Return".spawn = [ (lib.getExe pkgs.kitty) ];
          "Mod+B".spawn = [ (lib.getExe pkgs.brave) ];
          "Mod+P".spawn = [ (lib.getExe pkgs.bitwarden-desktop) ];
          "Mod+S".spawn = [ (lib.getExe pkgs.signal-desktop) ];
          

          "Mod+Q".close-window = _: { };
          "Mod+M".maximize-column = _: { };
          "Mod+F".fullscreen-window = _: { };
          "Mod+C".center-column = _: { };

          "Mod+H".focus-column-left = _: { };
          "Mod+L".focus-column-right = _: { };
          "Mod+K".focus-window-up = _: { };
          "Mod+J".focus-window-down = _: { };

          "Mod+Shift+H".move-column-left = _: { };
          "Mod+Shift+L".move-column-right = _: { };
          "Mod+Shift+K".move-window-up = _: { };
          "Mod+Shift+J".move-window-down = _: { };

          "Mod+N".focus-workspace = "w0";
          "Mod+E".focus-workspace = "w1";
          "Mod+I".focus-workspace = "w2";

          "Mod+Shift+N".move-column-to-workspace = "w0";
          "Mod+Shift+E".move-column-to-workspace = "w1";
          "Mod+Shift+I".move-column-to-workspace = "w2";

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