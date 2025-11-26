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
      signal-desktop
    ];
  };
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      ms-vscode.live-server
      jnoortheen.nix-ide
      asvetliakov.vscode-neovim
      vscjava.vscode-java-pack
      vscjava.vscode-java-debug
      redhat.java
      haskell.haskell
      justusadam.language-haskell
    ];
  };
  wayland.windowManager.hyprland = {
    settings = {
      general = {
	border_siz = 10;
      };
    };
  };
}
