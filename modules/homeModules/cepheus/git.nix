{ ... }: {
  flake.homeModules.git = { ... }: {
    programs.git = {
      enable = true;
      settings = {
        user.name = "MrProgrammerMan";
        url = {
          "git@github.com:" = {
            insteadOf = [
              "gh:"
            ];
          };
          "git@github.com:MrProgrammerMan/" = {
            insteadOf = [
              "ghmpm:"
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