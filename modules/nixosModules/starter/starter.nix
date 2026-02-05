{ self, ... }: {
  flake.nixosModules.starter = { ... }: {
    imports = with self.nixosModules; [
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