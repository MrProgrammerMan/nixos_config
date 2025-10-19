{ config, pkgs, ... }: {
  config = {
    networking.hostName = "laptop";
    system.stateVersion = "25.05";

    hardware.graphics.extraPackages = with pkgs; [ intel-media-driver ];

    services.xserver.videoDrivers = [ "modesetting" ];

    services.libinput.enable = true;
    services.thermald.enable = true;
    services.upower.enable = true;
  };
}
