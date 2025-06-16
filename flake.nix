{
  description = "NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:nixos/nixpkgs/staging-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    musnix = {
      url = "github:musnix/musnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    temmix = {
      url = "github:HITOA/temmix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nur, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    outputs = inputs.self.outputs;
  in
  {
    nixosConfigurations = {

      HITO = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [ 
          ./profiles/HITO/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.musnix.nixosModules.musnix
          inputs.temmix.nixosModules.temmix
          #inputs.aagl.nixosModules.default
          nur.modules.nixos.default
        ];
      };
      
    };

    nixosModules.default = ./nixosModules;
    homemanagerModules.default = ./homemanagerModules;
  };
}
