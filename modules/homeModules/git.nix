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
          email = "jonas.baugerud@proton.me";
          signingKey = "~/.ssh/id_ed25519.pub";
        };
        gpg = {
          format = "ssh";
        };
        commit = {
          gpgSign = true;
        };
        tag = {
          gpgSign = true;
        };
      };
    };
  };
}