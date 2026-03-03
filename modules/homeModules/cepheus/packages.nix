{ ... }: {
  flake.homeModules.packages = { pkgs, ... }: {
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
    ];
  };
}