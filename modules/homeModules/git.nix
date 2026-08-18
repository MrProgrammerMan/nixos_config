{ ... }: {
  flake.homeModules.git = { pkgs, ... }: {
    programs.git = {
      enable = true;
      package = pkgs.git.override { withLibsecret = true; };
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
        credential.helper = "libsecret";
      };
      signing = {
        format = "ssh";
        key = "~/.ssh/id_ed25519.pub";
        signByDefault = true;
      };
    };
  };
}