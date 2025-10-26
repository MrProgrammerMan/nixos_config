{ pkgs, ...}: {
  config = {
    users.users.cepheus = {
      isNormalUser = true;
      description = "Jonas Hazeland Baugerud";
      extraGroups = [ "networkmanager" "wheel" ];
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
        zettlr
	haskellPackages.hls
      ];
    };
  };
}
