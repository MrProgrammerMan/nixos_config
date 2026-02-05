{ ... }: {
  flake.nixosModules.packages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      libreoffice
    ];
    programs.git = {
      enable = true;
      package = pkgs.gitFull;
    };
    programs.ssh.enableAskPassword = false;
    programs.firefox.enable = true;
  };
}
