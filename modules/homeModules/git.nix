{ ... }: {
  flake.homeModules.git = { pkgs, ... }: {
    programs.git = {
      enable = true;
      package = pkgs.git.override { withLibsecret = true; };
      signing = {
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPTpoz1uH6bA4ctEIuzDsNWlS9NIbIcT3mg5rVcMUvpI jonas.baugerud@gmail.com";
        signByDefault = true;
      };
      settings = {
        gpg = {
          format = "ssh";
        };
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
  };
}