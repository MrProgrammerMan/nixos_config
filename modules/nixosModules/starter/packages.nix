{ ... }: {
  flake.nixosModules.packages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      libreoffice
      qt6.full
    ];
    programs.git.enable = true;
    programs.ssh.enableAskPassword = false;
    programs.firefox.enable = true;
  };
}
