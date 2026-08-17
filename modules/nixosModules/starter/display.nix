{ self, ... }: {
  flake.nixosModules.display = { lib, pkgs, ... }: {
    services.greetd = {
      enable = true;

      settings = {
        default_session = {
          command = "${lib.getExe pkgs.cage} -s -- ${lib.getExe pkgs.greetd.regreet}";
          user = "greeter";
        };
      };
    };

    services.accounts-daemon = {
      enable = true;
    };

    services.xserver.xkb = {
      layout = "no";
      variant = "";
    };
  };
}
