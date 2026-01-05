{ pkgs, ... }: {
  config = {
    environment.systemPackages = with pkgs; [
      libreoffice
    ];
    programs.git = {
      enable = true;
      config = {
        global = {
	  credential = "https://github.com.useHttpPath";
        };
      };
    };
    programs.firefox.enable = true;
  };
}
