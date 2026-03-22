{ ... }: {
  flake.homeModules.ssh = { pkgs, ... }: {
    programs.ssh = {
      enable = true;
      matchBlocks."*".addKeysToAgent = "yes";
      matchBlocks = {
        "os73" = {
          hostname = "os73.vlab.cs.oslomet.no";
          user = "group73";
          identityFile = "~/.ssh/s73";
        };
        "s44" = {
          hostname = "intel3.vlab.cs.oslomet.no";
          user = "s44";
          identityFile = "~/.ssh/id_ed25519";
        };
      };
    };
  };
}