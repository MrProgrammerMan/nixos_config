{ pkgs, ... }: {
  config = {
    environment.systemPackages = with pkgs; [
      libreoffice
    ];
    programs.git = {
      enable = true;
      package = pkgs.gitFull;
      config = {
	credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
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
    programs.ssh.enableAskPassword = false;
    programs.firefox.enable = true;
    virtualisation.virtualbox.host.enable = true;
    virtualisation.virtualbox.host.enableExtensionPack = true;
    virtualisation.docker = {
      enable = true;
    };
  };
}
