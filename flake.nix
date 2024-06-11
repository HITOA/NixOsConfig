{
  description = "NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
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
        ];
      };
      
    };

    nixosModules.default = ./nixosModules;
    homemanagerModules.default = ./homemanagerModules;
  };
}
