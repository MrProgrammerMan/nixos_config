{
  config = {
    programs.nvf = {
      enable = true;
      settings = {
        vim.autocomplete.nvim-cmp.enable = true;
        vim.autocomplete.nvim-cmp.sourcePlugins = [
          "cmp-nvim-lsp" "cmp-buffer" "cmp-path" "cmp-luasnip" "rustaceanvim" "crates-nvim" "nix-develop-nvim" "haskell-tools-nvim"
        ];
        vim.autopairs.nvim-autopairs.enable = true;
        vim.binds.cheatsheet.enable = true;
        vim.binds.hardtime-nvim.enable = true;
        vim.binds.whichKey.enable = true;
        vim.clipboard.enable = true;
        vim.theme.name = "tokyonight";
        vim.statusline.lualine.enable = true;
        vim.statusline.lualine.theme = "onedark";
        vim.languages.enableTreesitter = true;
        vim.filetree.nvimTree.enable = true;
        vim.telescope.enable = true;
        vim.git.vim-fugitive.enable = true;
        vim.git.gitsigns.enable = true;
      };
    };
  };
}