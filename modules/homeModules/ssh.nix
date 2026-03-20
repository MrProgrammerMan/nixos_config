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
      };
    };
  };
}