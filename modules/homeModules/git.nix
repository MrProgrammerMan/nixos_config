{ ... }: {
  flake.homeModules.git = { pkgs, ... }: {
    programs.git = {
      enable = true;
      signing = {
        format = "ssh";
        key = "~/.ssh/id_ed25519.pub";
        signByDefault = true;
      };
      settings = {
        user = {
          name = "MrProgrammerMan";
          email = "69722297+MrProgrammerMan@users.noreply.github.com";
        };
      };
    };
  };
}