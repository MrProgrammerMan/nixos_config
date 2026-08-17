{ ... }: {
  flake.nixosModules.systemd = { pkgs, ... }: {
    users.groups.nixos-config = {};
    systemd.tmpfiles.rules = [
      "Z /etc/nixos 0775 root nixos-config -"
    ];
    systemd.services.systemd-suspend.environment.SYSTEMD_SLEEP_FREEZE_USER_SESSIONS = "false";
  };
}
