{ ... }: {
  flake.homeModules.brave = { pkgs, ... }: {
    programs.chromium = {
      enable = true;
      extensions = [
        "eimadpbcbfnmbkopoojfekhnkhdbieeh"
      ];
      package = pkgs.brave;
    };
  };
}