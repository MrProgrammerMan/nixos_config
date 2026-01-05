{ pkgs, ... }: {
  config = {
    systemd.services.nixos-flake-update = {
      description = "Pull latest /etc/nixos flake on startup";
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.git}/bin/git -C /etc/nixos pull";
        User = "root";
      };
    };
    systemd.tmpfiles.rules = [
      "Z /etc/nixos 0775 root nixos-config -"
    ];
  };
}
