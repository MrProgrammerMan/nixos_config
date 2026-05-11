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
      signal-desktop
      vial
      protonmail-desktop
      eduvpn-client
      wireshark
      gns3-gui
    ];
  };
}