{ inputs, self, ... }: {
  flake.nixosModules.neovim = { pkgs, lib, ... }: {
    programs.neovim = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNeovim;
    };
  };

  perSystem = { self', pkgs, lib, ... }: {
    packages.myNeovim =
      ((inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [
          (
            { pkgs, ... }: {
              config.vim = {
                theme = {
                  enable = true;
                  name = "gruvbox";
                  style = "dark";
                };

                statusline.lualine.enable = true;
                telescope.enable = true;
                autocomplete.nvim-cmp.enable = true;

                languages = {
                  enableTreesitter = true;

                  nix.enable = true;
                  rust.enable = true;
                  haskell.enable = true;
                };
              };
            }
          )
        ];
      })
      .neovim).overrideAttrs (old: { # Why on earth is license and platforms missing????? Anyhow, this is required
        meta = old.meta // {
          license = lib.licenses.mit;
          platforms = old.meta.platforms or lib.platforms.unix;
        };
      });
  };
}