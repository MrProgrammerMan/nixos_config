{ inputs, ... }: {
  flake.nixosModules.packages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      libreoffice
      inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
    programs.git.enable = true;
    programs.ssh.enableAskPassword = false;
    programs.firefox.enable = true;
  };
}