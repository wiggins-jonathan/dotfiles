{
  description = "system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05-small";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      # Configuration for 'nas' machine
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

      # Configuration for 'nucbox' machine
      nucbox = nixpkgs.lib.nixosSystem {
        modules = [
          ./machines/nucbox/configuration.nix
          ./machines/nucbox/hardware-configuration.nix
          ./users/jonathan
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jonathan = import ./users/jonathan/home.nix;
          }
        ];
      };

    # Home-manager configuration for Steam Deck (no nixOS)
    };

    homeConfigurations."deck" = home-manager.lib.homeManagerConfiguration {
      inherit (nixpkgs.legacyPackages.x86_64-linux) pkgs;

      modules = [
        ./users/deck/home.nix
        ./pkgs/dircolors/dircolors.nix
        ./pkgs/git/git.nix
        ./pkgs/nvim/nvim.nix
        ./pkgs/zsh/zsh.nix
      ];
    };

    packages.x86_64-linux.default = self.homeConfigurations."deck".activationPackage;
  };
}
