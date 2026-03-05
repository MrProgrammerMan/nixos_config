{ ... }: {
  flake.nixosModules.secrets = { ... }: {
    age.secrets = {
      email-personal-password.file = ../../secrets/email/personal/password.age;
    };
  };
}