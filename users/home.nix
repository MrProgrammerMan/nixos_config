{ config, home-manager, ... }: {
  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPkgs = true;
    };
  };
}
