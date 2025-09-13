{ config, pkgs, nixpkgs-stable, ... }:

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
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

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
    packages = with nixpkgs-stable; [
      zettlr
    ];
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

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with nixpkgs-stable; [
    spotify
    signal-desktop
    discord
    brave
    wget
    gimp
    libreoffice
    inkscape
    bitwarden-desktop
  ];
  
  programs.steam.enable = true;
  programs.git.enable = true;
  programs.thunderbird.enable = true;
  programs.firefox.enable = true;
  programs.vscode.enable = true;
}
