{ inputs, self, ... }: {
  flake.homeConfigurations.carro = inputs.home-manager.lib.homeManagerConfiguration {
    modules = [ self.homeModules.carro ];
  };

  flake.nixosModules.carro = { config, ... }: {
    users.users.carro = {
      isNormalUser = true;
      description = "Caroline";
      extraGroups = [ "networkmanager" ];
      hashedPassword = "$6$eXQWL9QpZlMG2qLy$xdi2LZ2H0wUQ.PYlBMjwfsx3Tt/9mn7zoJGAmwNiKxQ3x5e26VdLD2TZU4LKqgygDVQylFSYZG1hLycNN8.Ji/";
    };
    home-manager.users.carro = self.homeModules.carro //
    { home.stateVersion = config.system.stateVersion; };
  };

  flake.homeModules.carro = { pkgs, config, ... }: {
    home.username = "carro";
    home.homeDirectory = "/home/carro";
    imports = with self.homeModules; [
      
    ];
    home.packages = with pkgs; [
      onedrive
      chromium
      signal-desktop
      discord
      thunderbird
      xournalpp
      microsoft-edge
      p3x-onenote
      spotify
      gnomeExtensions.gsconnect
      obsidian
      blanket
      gnomeExtensions.cronomix
    ];
  };
}