{ self, ... }: {
  flake.homeModules.email = { osConfig, ... }: {
    accounts.email.accounts = {
      personal = {
        address = osConfig.age.secrets.email-personal-address.path;
        userName = "cepheus";
        realName = osConfig.age.secrets.email-personal-name.path;
        passwordCommand = "cat " + osConfig.age.secrets.email-personal-password.path;
        flavor = "gmail.com";
        thunderbird.enable = true;
        primary = true;
      };
    };
  };
}