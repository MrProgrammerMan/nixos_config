{ self, inputs, ... }: {
  flake.nixosModules.display = { lib, pkgs, ... }: {
    imports = [
      inputs.noctalia-greeter.nixosModules.default
      inputs.noctalia.nixosModules.default
    ];

    programs.noctalia = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNoctalia;
    };

    programs.noctalia-greeter = {
      enable = true;

      # Optional configuration
      greeter-args = "";
      # Full declarative greeter.toml (overwritten on each activation).
      # See examples/greeter.toml for every key (appearance.palette, output, …).
      settings = {
        cursor = {
          theme = "Bibata-Modern-Ice";
          size = 24;
          path = "${pkgs.bibata-cursors}/share/icons";
        };
        keyboard = {
          layout = "us";
        };
        user.default = "cepheus";
      };
    };

    services.xserver.xkb = {
      layout = "no";
      variant = "";
    };
  };
}
