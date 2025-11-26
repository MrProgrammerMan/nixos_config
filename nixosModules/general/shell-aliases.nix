{
  config = {
    environment.shellAliases = {
      nixsw = ''
        cd /etc/nixos &&
        sudo git add . &&
        sudo git commit -m "Flake content update($(hostname))" || true &&
        sudo git push &&
        sudo nixos-rebuild switch --flake .#$(hostname)
      '';
      nixup = ''
        cd /etc/nixos &&
        sudo git add . &&
        sudo git commit -m "Flake content update($(hostname))" || true &&
        sudo git push &&
        sudo nix flake update &&
        sudo git add . &&
        sudo git commit -m "Flake update($(hostname))" || true &&
        sudo git push &&
        sudo nixos-rebuild switch --flake .#$(hostname)
      '';
    };
  };
}
