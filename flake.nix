{

  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-xr = {
      url = "github:nix-community/nixpkgs-xr";
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
    nixpkgs-xr,
    plasma-manager, 
    ... 
  }:
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs{
        inherit system;
        overlays = [
          nixpkgs-xr.overlays.default 
        ];
        config = {
          allowUnfree = true; 
        };
      };
    in {
      nixosConfigurations = {
        wired = lib.nixosSystem {
          inherit system;
          inherit pkgs;
          modules = [ ./nixos/00-hosts/wired/configuration.nix ];
        };
	      unwired = lib.nixosSystem {
          inherit system;
          inherit pkgs;
          modules = [ ./nixos/00-hosts/unwired/configuration.nix ];
        };
	      safe = lib.nixosSystem {
          inherit system;
          inherit pkgs;
          modules = [ ./nixos/00-hosts/safe/configuration.nix ];
        };
      };
      homeConfigurations = {
        desdpy = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ 
            ./home/00-users/desdpy.nix
            plasma-manager.homeModules.plasma-manager 
          ];
        };
        WiredDesdpy = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ 
            ./home/00-users/WiredDesdpy.nix
            plasma-manager.homeModules.plasma-manager 
          ];
        };
        SafeDesdpy = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ 
            ./home/00-users/SafeDesdpy.nix
          ];
        };
      };
    };
}
