{ ... }: {
  flake.homeModules.git = { ... }: {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "MrProgrammerMan";
          email = "69722297+MrProgrammerMan@users.noreply.github.com";
        };
        safe = {
          directory = "/etc/nixos";
        };
        gpg = {
          ssh = {
            allowedSignersFile = "~/.ssh/allowed_signers";
          };
        };
      };
      signing = {
        format = "ssh";
        key = "~/.ssh/id_ed25519.pub";
        signByDefault = true;
      };
    };
  };
}