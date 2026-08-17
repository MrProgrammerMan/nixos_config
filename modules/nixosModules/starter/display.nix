{ self, ... }: {
  flake.nixosModules.display = { lib, pkgs, ... }: {
    # services.greetd = {
    #   enable = true;

    #   settings = {
    #     default_session = {
    #       command = "${self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri}/bin/niri-session";
    #       user = "cephus";
    #     };
    #   };
    # };

    services.displayManager.gdm.enable = true;

    services.xserver.xkb = {
      layout = "no";
      variant = "";
    };
  };
}
