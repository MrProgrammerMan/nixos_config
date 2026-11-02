{ ... }: {
  flake.nixosModules.packages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      libreoffice
      brave
    ];
    programs.git.enable = true;
  };
}
