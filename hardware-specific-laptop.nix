# hardware-specific-laptop.nix
{ config, pkgs, ... }:

{
  # Bootloader configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.05";

  # Hostname for your laptop
  networking.hostName = "nixos-laptop";

  # Graphics setup
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # If Intel/AMD GPU (most laptops):
  services.xserver.videoDrivers = [ "modesetting" ];

  # Touchpad support
  services.libinput.enable = true;

  # Laptop power management
  services.thermald.enable = true;

  # Optional: battery health tools
  services.upower.enable = true;
}
