{ ... }: {
  flake.homeModules.git = { pkgs, ... }: {
    programs.git = {
      enable = true;
      package = pkgs.git.override { withLibsecret = true; };
      settings = {
        credential.helper = "libsecret";
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
    programs.ssh = {
      enable = true;
      matchBlocks."*".addKeysToAgent = "yes";
    };
  };
}