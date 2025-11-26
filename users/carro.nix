{ config, pkgs, ...}: {
  home = {
    username = "carro"
    homeDirectory = "/home/carro";
    stateVersion  = "25.05";
    packages = with pkgs; [
      onedrive
      chromium
      firefox
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
