{ pkgs, ... }: {
  config = {
    environment.systemPackages = with pkgs; [
      libreoffice
      bitwarden-desktop
      brave
    ];
    programs.thunderbird.enable = true;
    programs.firefox.enable = true;
  };
}