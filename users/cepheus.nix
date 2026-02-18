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
      mako
      xdg-desktop-portal-hyprland
      hyprpolkitagent
      libsForQt5.qt5.qtwayland
      openvpn
      solaar
      reaper
      vial
      rawtherapee
      protonmail-desktop
      digital
      gaphor
      pdf4qt
    ];
  };
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      ritwickdey.liveserver
      jnoortheen.nix-ide
      redhat.java
      anweber.vscode-httpyac
      theangryepicbanana.language-pascal
    ];
  };
  wayland.windowManager.hyprland = {
    settings = {
      general = {
	border_size = 1;
	gaps_in = 3;
	gaps_out = 2;
	float_gaps = 0;
	gaps_workspaces = 0;
	col = {
	  inactive_border = "rgb(0,0,0)";
	  active_border = "rgb(0,0,255)";
	};
      };
    };
  };
}
