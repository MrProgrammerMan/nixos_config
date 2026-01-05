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
      libsecret
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
	border_size = 1;
	gaps_in = 3;
	gaps_out = 2;
	"col.inactive_border" = "rgb(0, 0, 0)";
	"col.active_border" = "rgb(0, 0, 255)";
      };
    };
  };
  programs.git.config = {
    credential.helper = "libsecret";
    "credential \"https://github.com\"".useHttpPath = true;
    user.name = "MrProgrammerMan";
    url = {
      "https://github.com/" = {
        insteadOf = [
          "gh:"
          "github:"
        ];
      };
    };
  };
}
