{ ... }: {
  flake.nixosModules.secrets = { ... }: {
    age.secrets = {
      email-personal-address.file = ../../secrets/email/personal/address.age;
      email-personal-name.file = ../../secrets/email/personal/name.age;
      email-personal-password.file = ../../secrets/email/personal/password.age;
    };
  };
}