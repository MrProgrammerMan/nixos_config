{ ... }: {
  flake.homeModules.git = { pkgs, ... }: {
    programs.git = {
      settings = {
        credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
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
  };
}