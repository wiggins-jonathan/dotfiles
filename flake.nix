{
  description = "system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11-small";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixgl.url = "github:nix-community/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nixgl, ... }: {
    nixosConfigurations = {
      nas = nixpkgs.lib.nixosSystem {
        modules = [
          ./machines/nas/configuration.nix
          ./machines/nas/hardware-configuration.nix
          ./users/jonathan
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jonathan = import ./users/jonathan/home.nix;
          }
        ];
      };
    };

    # Home-manager configuration for Steam Deck (no nixOS)
    homeConfigurations."deck" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ nixgl.overlay ];
      };

      modules = [
        ./users/deck/home.nix
        ./pkgs/dircolors
        ./pkgs/git
        ./pkgs/nvim
        ./pkgs/zsh
        ./pkgs/ghostty
        ./pkgs/element-desktop
      ];
    };

    packages.x86_64-linux.default = self.homeConfigurations."deck".activationPackage;
  };
}
