{ pkgs, ... }: {
  config = {
    environment.systemPackages = with pkgs; [
      libreoffice
    ];
    programs.git = {
      enable = true;
      package = pkgs.gitFull;
      config = {
	credential.helper = "git-credential-store";
        "credential \"https://github.com\"" = {
          useHttpPath = true;
	  username = "MrProgrammerMan";
	};
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

