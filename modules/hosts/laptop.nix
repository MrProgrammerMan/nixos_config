{ inputs, self, ... }: {
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      laptop
      audio
      boot
      display
      gaming
      graphics
      locale
      networking
      nix
      packages
      printing
      shellAliases
      systemd
      users
    ];
  };

  flake.nixosModules.laptop = { config, lib, pkgs, modulesPath, ... }: {
    networking.hostName = "laptop";
    system.stateVersion = "25.05";

    hardware.graphics.extraPackages = with pkgs; [ intel-media-driver ];

    services.xserver.videoDrivers = [ "modesetting" ];

    services.libinput.enable = true;
    services.thermald.enable = true;
    services.upower.enable = true;

    imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

    boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/473d3001-2320-4f71-ad14-9f9df31c873c";
        fsType = "ext4";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/18DB-644C";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };

    swapDevices =
      [ { device = "/dev/disk/by-uuid/e4d1a741-4f36-48d7-8ff6-a76d3c62f8fb"; }
      ];

    networking.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}