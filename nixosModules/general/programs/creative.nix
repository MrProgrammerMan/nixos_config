{ pkgs, ... }: {
  config = {
    environment.systemPackages = with pkgs; [
      gimp
      inkscape
    ];
  };
}