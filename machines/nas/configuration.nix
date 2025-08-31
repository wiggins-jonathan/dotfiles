# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 3; # max num. of generations in boot menu
    };

    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "nas"; # Define your hostname.
  networking.firewall.enable = false;

  time.timeZone = "America/Phoenix";
  i18n.defaultLocale = "en_US.UTF-8";

  users.mutableUsers = false;

  programs = {
    zsh.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
        git
        tree
        home-manager
    ];
    shells = with pkgs; [bash zsh];
    shellAliases = {
      "ll"   = "ls -lAhNv --color=auto --group-directories-first";
      "ip"   = "ip --color=auto";
      "grep" = "grep --color=auto";
      "diff" = "diff --color=auto";
    };
    pathsToLink = ["/share/zsh"]; # zsh completion for system packages

    sessionVariables = {
      TZ = "America/Phoenix";
      DOMAIN = "wiggins.tech";
    };
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # services
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };
  services.tailscale.enable = true;
  virtualisation.docker.enable = true;

  # Do NOT change this value unless you have manually inspected all the changes
  # it would make to your configuration, and migrated your data accordingly.
  # For more information, see `man configuration.nix` or
  # https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}
