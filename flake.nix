{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager?ref=release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { ... } @ inputs:
    let
	system = "x86_64-linux";
	pkgs = inputs.nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      nixos = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
        ];
      };
    };
    homeConfigurations = {
      sid = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
	  inputs.nvf.homeManagerModules.default
	  ./home.nix
	];
      };
    };
  };
}
