{ self, ... }: {
  flake.nixosModules.starter = { ... }: {
    modules = with self.nixosModules; [
      audio
      boot
      display
      graphics
      locale
      networking
      nix
      printing
      packages
    ];
  };
}