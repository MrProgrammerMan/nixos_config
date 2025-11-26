{ pkgs, ... }: {
  config = {
    environment.systemPackages = with pkgs; [
      libreoffice
    ];
    programs.git.enable = true;
    programs.firefox.enable = true;
  };
}
