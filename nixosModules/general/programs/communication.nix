{ pkgs, ... }: {
  config = {
    environment.systemPackages = with pkgs; [
      signal-desktop
      discord
    ];
  };
}