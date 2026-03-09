{ ... }: {
  flake.nixosModules.systemd = { pkgs, ... }: {
    users.groups.nixos-config = {};
    systemd.tmpfiles.rules = [
      "Z /etc/nixos 0775 root nixos-config -"
    ];
  };
}
