{ ... }: {
  flake.nixosModules.shell = { ... }: {
    programs.zsh = {
      enable = true;
      initContent = ''
        PROMPT='%~ %# '
      '';
    };
  };
}
