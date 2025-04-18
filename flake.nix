{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: {
    nixosConfigurations."Victor-Server" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./configuration
        ./configuration/secrets.nix
      ];
    };
  };
}
