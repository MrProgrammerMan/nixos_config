{ ... }: {
  flake.homeModules.shell = { pkgs, ... }: {
    home.shell.enableZshIntegration = true;
  };
}