{ ... }: {
  flake.nixosModules.packages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      libreoffice
    ];
    programs.git.enable = true;
    programs.ssh.enableAskPassword = false;
    programs.firefox.enable = true;
  };
}
