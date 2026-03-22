{ ... }: {
  flake.homeModules.git = { pkgs, ... }: {
    programs.git = {
      enable = true;
      signing = {
        format = "ssh";
        signByDefault = true;
      };
      settings = {
        user = {
          name = "MrProgrammerMan";
          signingkey = "~/.ssh/id_ed25519.pub";
        };
      };
    };
  };
}