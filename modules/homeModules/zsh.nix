{ ... }: {
  flake.homeModules.git = { pkgs, ... }: {
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
        eval "$(direnv hook zsh)"
      '';
    };
  };
}