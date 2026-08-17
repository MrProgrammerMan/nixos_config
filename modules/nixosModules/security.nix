{ ... }: {
  flake.nixosModules.security = { pkgs, ... }: {
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.login.enableGnomeKeyring = true;
    security.polkit.enable = true;
    environment.systemPackages = with pkgs; [ gnome-keyring gcr networkmanagerapplet polkit_gnome ];
  };
}