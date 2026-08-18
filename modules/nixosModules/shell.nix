{ ... }: {
  flake.nixosModules.shell = { pkgs, ... }: {
    programs.zsh.enable = true;
    environment.systemPackages = [ pkgs.kitty ];
  };
}
