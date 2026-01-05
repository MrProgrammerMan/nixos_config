{ pkgs, ... }: {
  config = {
    environment.systemPackages = with pkgs; [
      libreoffice
    ];
    programs.git = {
      enable = true;
      config = {
	credential.helper = "git-credential-store";
        "credential \"https://github.com\"".useHttpPath = true;
	user.name = "MrProgrammerMan";
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
