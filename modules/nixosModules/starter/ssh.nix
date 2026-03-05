{ ... }: {
  flake.nixosModules.ssh = { ... }: {
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };
    programs.ssh.enableAskPassword = false;
  };
}