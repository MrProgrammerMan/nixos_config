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
    };
  };
}