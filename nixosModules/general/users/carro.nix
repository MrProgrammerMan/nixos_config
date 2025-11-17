{ pkgs, ...}: {
  config = {
    users.users.carro = {
      isNormalUser = true;
      description = "Caroline";
      extraGroups = [ "networkmanager" ];
      hashedPassword = "$6$eXQWL9QpZlMG2qLy$xdi2LZ2H0wUQ.PYlBMjwfsx3Tt/9mn7zoJGAmwNiKxQ3x5e26VdLD2TZU4LKqgygDVQylFSYZG1hLycNN8.Ji/";
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
	spotify
	gnomeExtensions.gsconnect
	obsidian
	blanket
	gnomeExtensions.cronomix
      ];
    };
  };
}
