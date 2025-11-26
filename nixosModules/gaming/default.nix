{ lib, config, ... }: {
  imports = [
    ./programs.nix
  ];
  options = {
    gaming.enable = lib.mkEnableOption "enables gaming stuff";
  };
  config = lib.mkIf config.gaming.enable {
    gaming.programs.enable = true;
  };
}
