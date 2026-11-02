{ ... }: {
  flake.homeModules.brave = { pkgs, ... }: {
    programs.chromium = {
      enable = true;
      extensions = [
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark reader
        "nalejidoccmgcmjjdcioafcjbilcjmlc" # Disable back swipe gesture
      ];
      package = pkgs.brave;
    };
  };
}