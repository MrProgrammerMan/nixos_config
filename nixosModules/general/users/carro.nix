{ pkgs, ...}: {
  config = {
    users.users.cepheus = {
      isNormalUser = true;
      description = "Caroline";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        onedrive
	libreoffice
        chromium
        signal-desktop
        discord
        thunderbird
        firefox
        xournalpp
	microsoft-edge
	p3x-onenote
	gnomeExtensions.gsconnect
	obsidian
	blanket
	gnome-shell-extension-cronomix
      ];
    };
  };
}
