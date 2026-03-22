{ ... }: {
  flake.homeModules.git = { pkgs, ... }: {
    programs.git = {
      enable = true;
      signing = {
        format = "ssh";
        signByDefault = true;
        key = "~/.ssh/id_ed25519.pub";
      };
      settings = {
        user = {
          name = "MrProgrammerMan";
        };
      };
    };
  };
}