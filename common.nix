{ config, pkgs, ... }:

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
    packages = with pkgs; [
      zettlr
    ];
  };

  environment.shellAliases = {
    nixdev = "nix develop -i -c bash --norc";
    nixsw-d = ''
	cd /etc/nixos &&
	sudo git add . &&
	sudo git commit -m "Flake content update(desktop)" || true &&
	sudo git push &&
	sudo nixos-rebuild switch --flake .#nixos-desktop
    '';
    nixsw-l = ''
	cd /etc/nixos &&
	sudo git add . &&
	sudo git commit -m "Flake content update(laptop)" || true &&
	sudo git push &&
	sudo nixos-rebuild switch --flake .#nixos-laptop
    '';
    nixup-d = ''
	cd /etc/nixos &&
	sudo git add . &&
	sudo git commit -m "Flake content update(desktop)" || true &&
	sudo git push &&
	sudo nix flake update &&
	sudo git add . &&
	sudo git commit -m "Flake update(desktop)" || true &&
	sudo git push &&
	sudo nixos-rebuild switch --flake .#nixos-desktop
    '';
    nixup-l = ''
	cd /etc/nixos &&
	sudo git add . &&
	sudo git commit -m "Flake content update(laptop)" || true &&
	sudo git push &&
	sudo nix flake update &&
	sudo git add . &&
	sudo git commit -m "Flake update(laptop)" || true &&
	sudo git push &&
	sudo nixos-rebuild switch --flake .#nixos-laptop
    '';
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    spotify
    signal-desktop
    git
    vscode
    discord
    thunderbird
    brave
    wget
    gimp
    libreoffice
    inkscape
    bitwarden-desktop
    steam
    steam-run
  ];
  
  programs.steam.enable = true;
}
