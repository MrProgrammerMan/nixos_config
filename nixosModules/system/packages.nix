{ pkgs, ... }: {
  config = {
    environment.systemPackages = with pkgs; [
      libreoffice
    ];
    programs.git = {
      enable = true;
      config = {
        "credential \"https://github.com\"".useHttpPath = true;
	url = {
          "https://github.com/" = {
            insteadOf = [
              "gh:"
              "github:"
            ];
          };
        };
      };
    };
    programs.firefox.enable = true;
  };
}
