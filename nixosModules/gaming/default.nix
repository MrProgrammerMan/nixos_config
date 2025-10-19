{ lib, config, ... }: {
  imports = [
    ./programs
  ];
  options = {
    gaming.enable = lib.mkEnableOption "enables gaming stuff";
  };
  config = lib.mkIf config.gaming.enable {
    gaming.programs.enable = true;
  };
}