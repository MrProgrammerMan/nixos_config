{ self, inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.myNoctalia = pkgs.noctalia-shell;
    #packages.myNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      #inherit pkgs;
      #settings =
      #  (builtins.fromJSON
      #    (builtins.readFile ./noctalia.json)).settings;
    #};
  };
}