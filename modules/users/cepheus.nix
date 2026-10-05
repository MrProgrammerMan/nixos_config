{ inputs, self, ... }: {
  flake.homeConfigurations.cepheus = inputs.home-manager.lib.homeManagerConfiguration {
    modules = [ self.homeModules.cepheus ];
  };

  flake.nixosModules.cepheus =  { config, pkgs, ... }: {
    users.groups.nixos-config = {};
    users.users.cepheus = {
      isNormalUser = true;
      description = "Jonas";
      extraGroups = [ "networkmanager" "wheel" "input" "abdusers" "kvm" "nixos-config" "docker" ];
      hashedPassword = "$6$FcB9ictE6iKsk9AO$71mmUjZ4WW9X58.bhF1jUatvGce8vscNxvFJfRV5WXyIz0Z6mROsEiqVSQ2alJq1KhTW5fuYSIALuXW8y4rzZ1";
      shell = pkgs.zsh;
    };
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    xdg.portal.config.common.default = "gtk";

    environment.systemPackages = [
      pkgs.gsettings-desktop-schemas
    ];

    home-manager.backupFileExtension = "backup";
    home-manager.users.cepheus = {
      imports = [ self.homeModules.cepheus ];
      home.stateVersion = config.system.stateVersion;
    };
  };

  flake.homeModules.cepheus = { pkgs, config, ... }: {
    home.username = "cepheus";
    home.homeDirectory = "/home/cepheus";
    imports = with self.homeModules; [
      git
      vscode
      brave
      direnv
      zsh
      ssh
    ];
    home.packages = with pkgs; [
      bitwarden-desktop
      discord
      gimp
      inkscape
      thunderbird
      vial
      protonmail-desktop
      eduvpn-client
      wireshark
      gns3-gui
      github-cli
      prismlauncher
      bruno
      gnome-calculator
      nautilus
      fuzzel
      racket
      (pkgs.symlinkJoin {
        name = "signal-desktop";
        paths = [ pkgs.signal-desktop ];
        buildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/signal-desktop \
            --add-flags '--password-store="gnome-libsecret"'
        '';
      })
    ];
    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
      gtk4 = {
        extraConfig = {
          gtk-application-prefer-dark-theme = 1;
        };
        theme = config.gtk.theme;
      };
    };
    home.sessionVariables = {
      GTK_THEME = "Adwaita-dark";
    };
  };
}
