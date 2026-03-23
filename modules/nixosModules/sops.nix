{ inputs, ... }: {
  flake.nixosModules.sops = { ... }: {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];
    sops = {
      defaultSopsFile = ../../secrets.yaml;
      defaultSopsFormat = "yaml";
      age = {
        sshKeyPaths = [ "/home/cepheus/.ssh/id_25519" ];
      };
      secrets = {
        example_key = {};
      };
    };
  };
}
