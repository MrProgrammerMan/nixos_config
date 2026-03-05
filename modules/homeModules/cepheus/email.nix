{ ... }: {
  flake.homeModules.email = { config, ... }: {
    accounts.email.acounts = {
      personal = {
        address = config.age.secrets.email-personal-address.path;
      };
    };
  };
}