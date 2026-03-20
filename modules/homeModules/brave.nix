{ ... }: {
  flake.homeModules.brave = { pkgs, ... }: {
    programs.chromium = {
      enable = true;
      package = pkgs.brave;
    };
  };
}