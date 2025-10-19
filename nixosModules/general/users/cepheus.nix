{ pkgs, ...}: {
  config = {
    users.users.cepheus = {
      isNormalUser = true;
      description = "Jonas Hazeland Baugerud";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        zettlr
      ];
    };
  };
}