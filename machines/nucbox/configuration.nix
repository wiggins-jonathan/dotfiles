# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 3;
    };

    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "nucbox";
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

  system.stateVersion = "23.05"; # Do not change unless you know what you're doing
}
