{ ... }: {
  flake.homeModules.ssh = { pkgs, ... }: {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "*" = {
          addKeysToAgent = "yes";
          forwardAgent = false;
          compression = false;
          serverAliveInterval = 0;
          serverAliveCountMax = 3;
          hashKnownHosts = false;
          userKnownHostsFile = "~/.ssh/known_hosts";
          controlMaster = "auto";
          controlPath = "~/.ssh/master-%r@%n:%p";
          controlPersist = "no";
        };
        "os73" = {
          hostname = "os73.vlab.cs.oslomet.no";
          user = "group73";
          identityFile = "~/.ssh/s73";
        };
        "s44" = {
          hostname = "intel3.vlab.cs.oslomet.no";
          user = "s44";
          identityFile = "~/.ssh/id_ed25519";
          port = 5044;
        };
      };
    };
  };
}