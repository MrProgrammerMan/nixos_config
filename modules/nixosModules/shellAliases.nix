{ inputs, ... }: {
  flake.nixosModules.shellAliases = { pkgs, ... }: {
    environment.shellAliases = {
      nixsw = ''
        cd /etc/nixos &&
        git add . &&
        git commit -m "Flake content update($(hostname))" || true &&
        git push &&
        sudo nixos-rebuild switch --flake .#$(hostname)
      '';
      nixup = ''
        cd /etc/nixos &&
        git add . &&
        git commit -m "Flake content update($(hostname))" || true &&
        git push &&
        nix flake update &&
        git add . &&
        git commit -m "Flake update($(hostname))" || true &&
        git push &&
        sudo nixos-rebuild switch --flake .#$(hostname)
      '';
    };
  };
}
