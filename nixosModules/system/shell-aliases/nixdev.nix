{
  config = {
    environment.shellAliases = {
      nixdev = "nix develop -c env PS1=\"\\e[0;35mdev@\\W \\$ \\e[0m\" CARGO_TERM_COLOR=always bash --norc -i";
    };
  };
}