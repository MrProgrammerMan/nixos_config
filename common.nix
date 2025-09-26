{ config, pkgs, pkgs-stable, ... }:

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

  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };

  console.keyMap = "no";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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
    subUidRanges = [{ startUid = 100000; count = 65536; }];
    subGidRanges = [{ startGid = 100000; count = 65536; }];
  };

  environment.shellAliases = {
    nixdev = "nix develop -i -c env PS1=\"\\e[0;35mdev@\\W \\$ \\e[0m\" CARGO_TERM_COLOR=always bash --norc -i";
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
    spotify
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
    gcc
    mangohud
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
    ];
  };
  programs.neovim = {
    enable = true;
    package = pkgs-stable.neovim-unwrapped.overrideAttrs (oldAttrs: rec {
      buildInputs = oldAttrs.buildInputs or [] ++ [
        pkgs-stable.lua5_4_compat
        pkgs-stable.lua54Packages.lpeg
      ];
    });
    configure = {
      packages.myVimPackage = with pkgs-stable.vimPlugins; {
	start = [
	  lazy-nvim
	  telescope-nvim
	  neo-tree-nvim
	  which-key-nvim
	  nvim-treesitter
	  comment-nvim
	  nvim-autopairs
	  gitsigns-nvim
	  lualine-nvim
 	  bufferline-nvim
	  catppuccin-nvim
	  nvim-lspconfig
	  nvim-cmp
	  cmp-nvim-lsp
	  cmp-buffer
	  cmp-path
	  luasnip
	  cmp_luasnip
        ];
      };
    };
  };
}
