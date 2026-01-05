{
  config = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.settings.substituters = [ "https://nixcache.reflex-frp.org" "https://hyprland.cachix.org" ];
    nix.settings.trusted-substituters = [ "https://hyprland.cachix.org" ];
    nix.settings.trusted-public-keys = [ "ryantrinkle.com-1:JJiAKaRv9mWgpVAz8dwewnZe0AzzEAzPkagE9SP5NWI=" "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    nix.channel.enable = false;
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
