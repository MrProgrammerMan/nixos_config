{ ... }: {
  flake.homeModules.zsh = { pkgs, ... }: {
    programs.zsh = {
      enable = true;
      autocd = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll  = "ls -la";
        ".." = "cd ..";
        "..." = "cd ../..";
        gs = "git status";
        gd = "git diff";
        ga = "git add .";
        gc = "git commit - m";
        gp = "git push";
      };

      initContent = ''
        PROMPT='%~ %# '
        eval "$(direnv hook zsh)"
      '';
      
      plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];
    };
  };
}