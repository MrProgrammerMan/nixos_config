{ pkgs, ...}: {
  config = {
    users.users.carro = {
      isNormalUser = true;
      description = "Caroline";
      extraGroups = [ "networkmanager" ];
      hashedPassword = "$6$pneBpmZMJV5BqKi/$n.k2HbZPiWPmhKbGq16/aW0EGDbz2f1OzLfdAqThlJIuNp9G3PerJi1qsj5QM5mrTMuF2A.AmUWATWbhNs6OJ.";
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
	gnomeExtensions.cronomix
      ];
    };
  };
}
