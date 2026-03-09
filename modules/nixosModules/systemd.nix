{ ... }: {
  flake.nixosModules.systemd = { pkgs, ... }: {
    users.groups.nixos-config = {};
    systemd.tmpfiles.rules = [
      "Z /etc/nixos 0775 root nixos-config -"
    ];
    systemd = {
      services."gnome-suspend" = {
        description = "suspend gnome shell";
        before = [
          "systemd-suspend.service" 
          "systemd-hibernate.service"
          "nvidia-suspend.service"
          "nvidia-hibernate.service"
        ];
        wantedBy = [
          "systemd-suspend.service"
          "systemd-hibernate.service"
        ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = ''${pkgs.procps}/bin/pkill -f -STOP ${pkgs.gnome-shell}/bin/gnome-shell'';
        };
      };
      services."gnome-resume" = {
        description = "resume gnome shell";
        after = [
          "systemd-suspend.service" 
          "systemd-hibernate.service"
          "nvidia-resume.service"
        ];
        wantedBy = [
          "systemd-suspend.service"
          "systemd-hibernate.service"
        ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = ''${pkgs.procps}/bin/pkill -f -CONT ${pkgs.gnome-shell}/bin/gnome-shell'';
        };
      };
    };
  };
}
