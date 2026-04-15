{ ... }: {
  flake.homeModules.vscode = { pkgs, ... }: {
    programs.vscode = {
      enable = true;
      mutableExtensionsDir = false;
      profiles.default ={
        extensions = with pkgs.vscode-extensions; [
          rust-lang.rust-analyzer
          ritwickdey.liveserver
          jnoortheen.nix-ide
          redhat.java
          anweber.vscode-httpyac
          theangryepicbanana.language-pascal
          myriad-dreamin.tinymist
          haskell.haskell
          anweber.vscode-httpyac
        ];
        userSettings = {
          "rust-analyzer.cargo.features" = "all";
          "rust-analyzer.procMacro.ignored" = {
            "leptos_macro" = [ "server" ];
          };
          "editor.inlineSuggest.enabled" = false;
          "github.copilot.editor.enableAutoCompletions" = false;
        };
      };
    };
  };
}