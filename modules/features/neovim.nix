{ inputs, self, ... }:
{
  flake.nixosModules.neovim =
    { pkgs, lib, ... }:
    {
      programs.neovim = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNeovim;
      };
    };

  perSystem =
    { self', pkgs, lib, ... }:
    {
      packages.myNeovim =
        (
          (inputs.nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = [
              (
                { pkgs, ... }:
                {
                  config.vim = {
                    autocomplete.nvim-cmp.enable = true;
                    autopairs.nvim-autopairs.enable = true;

                    binds = {
                      cheatsheet.enable = true;
                      whichKey.enable = true;
                    };

                    clipboard.enable = true;
                    comments.comment-nvim.enable = true; # gcc / gc

                    git = {
                      enable = true;
                      gitsigns.enable = true;
                    };

                    languages = {
                      enableExtraDiagnostics = true;
                      enableFormat = true;
                      enableTreesitter = true;

                      elm.enable = true;
                      haskell.enable = true;
                      java.enable = true;
                      markdown.enable = true;
                      nix.enable = true;
                      python.enable = true;
                      rust.enable = true;
                      zsh.enable = true;
                    };

                    lsp = {
                      enable = true;
                      formatOnSave = true;
                      lightbulb.enable = true;
                      lspkind.enable = true;
                      trouble.enable = true;
                    };

                    snippets.luasnip.enable = true;
                    statusline.lualine.enable = true;
                    telescope.enable = true;

                    theme = {
                      enable = true;
                      name = "oxocarbon";
                      style = "dark";
                    };

                    treesitter = {
                      enable = true;
                      context.enable = true;
                    };

                    utility = {
                      motion.flash-nvim.enable = true;
                      surround.enable = true; # cs"' etc.
                    };

                    options = {
                      expandtab = true;
                      tabstop = 4;
                      softtabstop = 4;
                      shiftwidth = 4;
                    };

                    autocmds = [
                      {
                        event = [ "FileType" ];
                        pattern = [ "elm" ];
                        desc = "Elm: 4 spaces, as elm-format expects";
                        command = "setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4";
                      }
                      {
                        event = [ "FileType" ];
                        pattern = [ "nix" ];
                        desc = "Nix: 2 spaces";
                        command = "setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2";
                      }
                    ];
                  };
                }
              )
            ];
          }).neovim
        ).overrideAttrs
          (old: {
            # Why on earth is license and platforms missing????? Anyhow, this is required
            meta = old.meta // {
              license = lib.licenses.mit;
              platforms = old.meta.platforms or lib.platforms.unix;
            };
          });
    };
}