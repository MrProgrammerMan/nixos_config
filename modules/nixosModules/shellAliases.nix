{ ... }: {
  flake.nixosModules.shellAliases = { ... }: {
    environment.shellAliases = {
      nixedit = ''
        cd /etc/nixos &&
        git pull
      '';
      nixactivate = ''
        cd /etc/nixos &&
        git add . &&
        git commit -m "Flake content update($(hostname))" || true &&
        git push &&
        sudo nixos-rebuild switch --flake .#$(hostname)
      '';
    };
  };
}
