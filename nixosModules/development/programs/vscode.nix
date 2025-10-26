{ pkgs, ... }: {
  config = {
    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        rust-lang.rust-analyzer
        ms-vscode.live-server
        jnoortheen.nix-ide
        asvetliakov.vscode-neovim
        vscjava.vscode-java-pack
        vscjava.vscode-java-debug
        redhat.java
	haskell.haskell
      ];
    };
  };
}
