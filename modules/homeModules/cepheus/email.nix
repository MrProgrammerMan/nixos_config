{ self, ... }: {
  flake.homeModules.email = { osConfig, ... }: {
    accounts.email.accounts = {
      personal = {
        address = "jonas.baugerud@gmail.com";
        userName = "cepheus";
        realName = "Jonas Hazeland Baugerud";
        passwordCommand = "cat " + osConfig.age.secrets.email-personal-password.path;
        flavor = "gmail.com";
        thunderbird.enable = true;
        primary = true;
      };
    };
  };
}