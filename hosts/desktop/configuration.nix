{ config, pkgs, ... }: {
  config = {
    networking.hostName = "desktop";
    system.stateVersion = "25.05";

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      nvidiaSettings = true;
      powerManagement.enable = false;
      open = false;
      prime.sync.enable = false;
    };
  };
}