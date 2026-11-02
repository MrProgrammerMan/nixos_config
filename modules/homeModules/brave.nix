{ ... }: {
  flake.homeModules.brave = { pkgs, ... }: {
    programs.chromium = {
      enable = true;
      extensions = [
        "eimadpbcbfnmbkopoojfekhnkhdbieeh"
        "nalejidoccmgcmjjdcioafcjbilcjmlc"
      ];
      package = pkgs.brave;
    };
  };
}