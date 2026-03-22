{ inputs, self, ... }: {
  flake.homeConfigurations.cepheus = inputs.home-manager.lib.homeManagerConfiguration {
    modules = [ self.homeModules.cepheus ];
  };

  flake.nixosModules.cepheus =  { config, ... }: {
    users.groups.nixos-config = {};
    users.users.cepheus = {
      isNormalUser = true;
      description = "Jonas";
      extraGroups = [ "networkmanager" "wheel" "input" "abdusers" "kvm" "nixos-config" "vboxusers" ];
      hashedPassword = "$6$FcB9ictE6iKsk9AO$71mmUjZ4WW9X58.bhF1jUatvGce8vscNxvFJfRV5WXyIz0Z6mROsEiqVSQ2alJq1KhTW5fuYSIALuXW8y4rzZ1";
      shell = pkgs.zsh;
    };
    home-manager.users.cepheus = self.homeModules.cepheus //
    { home.stateVersion = config.system.stateVersion; };
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
      eduvpn
    ];
    home.packages = with pkgs; [
      bitwarden-desktop
      discord
      gimp
      inkscape
      thunderbird
      spotify
      zettlr
      signal-desktop
      reaper
      vial
      rawtherapee
      protonmail-desktop
      act
    ];
  };
}