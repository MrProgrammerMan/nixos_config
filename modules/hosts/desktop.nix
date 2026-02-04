{ inputs, self, ... }: {
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      desktop
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

  flake.nixosModules.desktop = { config, lib, pkgs, modulesPath, ... }: {
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

    imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/069471e5-f88b-4e62-831c-58a7a0b57d84";
        fsType = "ext4";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/1514-11C9";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };

    swapDevices =
      [ { device = "/dev/disk/by-uuid/5f13285a-4862-49c2-8a97-b799028033b7"; }
      ];

    networking.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}