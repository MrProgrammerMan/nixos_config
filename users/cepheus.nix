{ config, pkgs, ...}: {
  home = {
    username = "cepheus";
    homeDirectory = "/home/cepheus";
    stateVersion = "25.05";
    packages = with pkgs; [
      bitwarden-desktop
      brave
      chromium
      discord
      gimp
      inkscape
      thunderbird
      spotify
      zettlr
    ];
  };
}
