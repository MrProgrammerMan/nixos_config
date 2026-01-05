{ pkgs, ... }: {
  config = {
    environment.systemPackages = with pkgs; [
      libreoffice
    ];
    programs.git = {
      enable = true;
      config = {
        credential."https://github.com.useHttpPath" = true;
      };
    };
    programs.firefox.enable = true;
  };
}
