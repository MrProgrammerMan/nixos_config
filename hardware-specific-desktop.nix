{ config, pkgs, ... }:

{
  # Bootloader configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "nixos-desktop";

  system.stateVersion = "25.05";    

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  # Enable NVIDIA drivers
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    nvidiaSettings = true;
    powerManagement.enable = false;
    open = false;
    prime.sync.enable = false;
  };
}
