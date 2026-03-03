{ ... }: {
  flake.homeModules.vscode = { pkgs, ... }: {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode-fhs;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        rust-lang.rust-analyzer
        ritwickdey.liveserver
        jnoortheen.nix-ide
        redhat.java
        anweber.vscode-httpyac
        theangryepicbanana.language-pascal
      ];
    };
  };
}