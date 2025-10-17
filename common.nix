{ config, pkgs, pkgs-stable, spotify-password, ... }:

{
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Oslo";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nb_NO.UTF-8";
    LC_IDENTIFICATION = "nb_NO.UTF-8";
    LC_MEASUREMENT = "nb_NO.UTF-8";
    LC_MONETARY = "nb_NO.UTF-8";
    LC_NAME = "nb_NO.UTF-8";
    LC_NUMERIC = "nb_NO.UTF-8";
    LC_PAPER = "nb_NO.UTF-8";
    LC_TELEPHONE = "nb_NO.UTF-8";
    LC_TIME = "nb_NO.UTF-8";
  };
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };  
  
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };
  
  programs.dconf.enable = true;
  programs.dconf.profiles.user.databases = [{
    settings = {
      "org/gnome/desktop/interface" = {
        icon-theme = "Adwaita";
	cursor-theme = "Adwaita";
	gtk-theme = "Adwaita";
	color-scheme = "prefer-dark";
        clock-format = "24h";
      };
    };
  }];

  console.keyMap = "no";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  programs.noisetorch.enable = true;
  security.rtkit.enable = true;
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.xone.enable = true;

  systemd.services.nixos-flake-update = {
    description = "Pull latest /etc/nixos flake on startup";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.git}/bin/git -C /etc/nixos pull";
      User = "root";                  # run as root since /etc/nixos is root-owned
    };
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.cepheus = {
    isNormalUser = true;
    description = "Jonas Hazeland Baugerud";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs-stable; [
      zettlr
    ];
  };

  environment.shellAliases = {
    nixdev = "nix develop -c env PS1=\"\\e[0;35mdev@\\W \\$ \\e[0m\" CARGO_TERM_COLOR=always bash --norc -i";
    nixsw = ''
	cd /etc/nixos &&
	sudo git add . &&
	sudo git commit -m "Flake content update($(hostname))" || true &&
	sudo git push &&
	sudo nixos-rebuild switch --flake .#$(hostname)
    '';
    nixup = ''
	cd /etc/nixos &&
	sudo git add . &&
	sudo git commit -m "Flake content update($(hostname))" || true &&
	sudo git push &&
	sudo nix flake update &&
	sudo git add . &&
	sudo git commit -m "Flake update($(hostname))" || true &&
	sudo git push &&
	sudo nixos-rebuild switch --flake .#$(hostname)
    '';
  };

  environment.systemPackages = with pkgs-stable; [
    signal-desktop
    discord
    brave
    wget
    gimp
    libreoffice
    inkscape
    bitwarden-desktop
    cargo
    rustc
    mangohud
    adwaita-icon-theme
    processing
    jdk
  ];
  
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    package = pkgs-stable.steam;
  };
  programs.gamemode.enable = true;
  programs.git = {
    enable = true;
    package = pkgs-stable.git;
  };
  programs.thunderbird = {
    enable = true;
    package = pkgs-stable.thunderbird;
  };
  programs.firefox = {
    enable = true;
    package = pkgs-stable.firefox;
  };
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      ms-vscode.live-server
      jnoortheen.nix-ide
      asvetliakov.vscode-neovim
      vscjava.vscode-java-pack
      vscjava.vscode-java-debug
      redhat.java
    ];
    package = pkgs-stable.vscode;
  };
  programs.nvf = {
    enable = true;
    settings = {
      vim.autocomplete.nvim-cmp.enable = true;
      vim.autocomplete.nvim-cmp.sourcePlugins = [
	"cmp-nvim-lsp" "cmp-buffer" "cmp-path" "cmp-luasnip" "rustaceanvim" "crates-nvim" "nix-develop-nvim" "haskell-tools-nvim"
      ];
      vim.autopairs.nvim-autopairs.enable = true;
      vim.binds.cheatsheet.enable = true;
      vim.binds.hardtime-nvim.enable = true;
      vim.binds.whichKey.enable = true;
      vim.clipboard.enable = true;
      vim.theme.name = "tokyonight";
      vim.statusline.lualine.enable = true;
      vim.statusline.lualine.theme = "onedark";
      vim.languages.enableTreesitter = true;
      vim.filetree.nvimTree.enable = true;
      vim.telescope.enable = true;
      vim.git.vim-fugitive.enable = true;
      vim.git.gitsigns.enable = true;
    };
  };
  services.spotifyd = {
    enable = true;
    settings.global = {
      bitrate = 320;
      username = "alltheusernamesweretaken";
      password = spotify-password;
    };
  };
}
