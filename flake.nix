{

  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { 
    nixpkgs, 
    home-manager, 
    nur,
    plasma-manager, 
    ... 
  }:
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs{
        inherit system;
        overlays = [ 
          nur.overlays.default 
        ];
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        wired = lib.nixosSystem {
          inherit system;
          inherit pkgs;
          modules = [ ./hosts/wired/configuration.nix ];
        };
	unwired = lib.nixosSystem {
          inherit system;
          inherit pkgs;
          modules = [ ./hosts/unwired/configuration.nix ];
        };
      };
      homeConfigurations = {
        desdpy = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ 
            ./users/desdpy.nix
            plasma-manager.homeManagerModules.plasma-manager 
          ];
        };
      };
    };
}
