{
  description = "Snowflake from Nashira Deer";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, lanzaboote, ...}@inputs: {
    nixosConfigurations.Snowflake = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
	
        lanzaboote.nixosModules.lanzaboote
        ./lanzaboote.nix
      ];
    };
  };
}

