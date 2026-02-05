{ ... }: {
  flake.nixosModules.nix = { ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.channel.enable = false;
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
