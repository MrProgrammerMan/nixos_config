{ pkgs, ...}: {
  config = {
    users.users.cepheus = {
      isNormalUser = true;
      description = "Jonas Hazeland Baugerud";
      extraGroups = [ "networkmanager" "wheel" ];
      hashedPassword = "$6$FcB9ictE6iKsk9AO$71mmUjZ4WW9X58.bhF1jUatvGce8vscNxvFJfRV5WXyIz0Z6mROsEiqVSQ2alJq1KhTW5fuYSIALuXW8y4rzZ1";
      packages = with pkgs; [
        libreoffice
        bitwarden-desktop
        brave
        signal-desktop
        discord
        gimp
        inkscape
        thunderbird
        firefox
	spotify
        zettlr
	haskellPackages.hls-plugin-api
      ];
    };
  };
}
