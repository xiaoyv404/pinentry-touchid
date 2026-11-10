{
  description = "pinentry-touchid - Touch ID-backed pinentry for GPG/SSH on macOS";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      packages = forAllSystems (
        pkgs: rec {
          pinentry-touchid = pkgs.buildGoModule {
            pname = "pinentry-touchid";
            version = self.shortRev or "dev";
            src = self;
            vendorHash = "sha256-j/Lae+buEyLCkwFgFL9rcPW9dTQExuPT11sPLEEkONs=";

            # only the root package; ./go-assuan is a vendored module via a local replace
            subPackages = [ "." ];

            # tests talk to the login Keychain and cannot run inside the build sandbox
            doCheck = false;
          };
          default = pinentry-touchid;
        }
      );

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            go
            gopls
            gotools
          ];
        };
      });
    };
}
