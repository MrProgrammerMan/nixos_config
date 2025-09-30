{
  description = "Flake to build BETAFPV Configurator (v2.0.1) on NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        # Electron runtime (v25 matches Node 16 best)
        electron = pkgs.electron_25;

        betafpv-configurator = pkgs.stdenv.mkDerivation rec {
          pname = "betafpv-configurator";
          version = "2.0.1";

          src = pkgs.fetchurl {
            url = "https://github.com/BETAFPV/BETAFPV_Configurator/archive/refs/tags/V${version}.tar.gz";
            sha256 = "sha256-3vt2IrzfVbymfmRCX4gkCBVr8Dgrdrvg8Gry2Z7SQVk="; # replace with real hash
          };

          nativeBuildInputs = [ pkgs.nodejs-16_x pkgs.yarn pkgs.electron-packager ];

          buildPhase = ''
            export HOME=$TMPDIR
            yarn install --frozen-lockfile
            yarn run build || true  # some electron apps don’t ship a build step
          '';

          installPhase = ''
            mkdir -p $out/bin
            cp -r . $out/share/${pname}
            cat > $out/bin/${pname} <<EOF
            #!${pkgs.runtimeShell}
            exec ${electron}/bin/electron $out/share/${pname} "\$@"
            EOF
            chmod +x $out/bin/${pname}
          '';
        };

      in {
        packages.default = betafpv-configurator;
      });
}
