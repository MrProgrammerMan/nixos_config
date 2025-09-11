{ config, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix
      ./common.nix
      ./hardware-specific.nix
    ];

  system.stateVersion = "25.05"; # Set this to your install version
}
