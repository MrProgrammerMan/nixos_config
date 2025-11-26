{ pkgs, ...}: {
  config = {
    users.users = {
      cepheus = {
        isNormalUser = true;
        description = "Jonas Hazeland Baugerud";
        extraGroups = [ "networkmanager" "wheel" ];
        hashedPassword = "$6$FcB9ictE6iKsk9AO$71mmUjZ4WW9X58.bhF1jUatvGce8vscNxvFJfRV5WXyIz0Z6mROsEiqVSQ2alJq1KhTW5fuYSIALuXW8y4rzZ1";
        packages = with pkgs; [
          bitwarden-desktop
          brave
          signal-desktop
          discord
          gimp
          inkscape
          thunderbird
          spotify
          zettlr
          haskellPackages.hls-plugin-api
        ];
      };
      carro = {
        isNormalUser = true;
        description = "Caroline";
        extraGroups = [ "networkmanager" ];
        hashedPassword = "$6$eXQWL9QpZlMG2qLy$xdi2LZ2H0wUQ.PYlBMjwfsx3Tt/9mn7zoJGAmwNiKxQ3x5e26VdLD2TZU4LKqgygDVQylFSYZG1hLycNN8.Ji/";
        packages = with pkgs; [
          onedrive
          chromium
          signal-desktop
          discord
          thunderbird
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
  };
}
