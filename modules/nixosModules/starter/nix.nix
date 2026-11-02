{ ... }: {
  flake.nixosModules.nix = { ... }: {
    nix = {
      settings.experimental-features = [ "nix-command" "flakes" ];
      channel.enable = false;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };
    nixpkgs.config.allowUnfree = true;
  };
}
