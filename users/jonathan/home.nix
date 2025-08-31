{ pkgs, ... }:

{
  imports = [
    ../../pkgs/zsh
    ../../pkgs/nvim
    ../../pkgs/git
    ../../pkgs/dircolors
  ];

  home = {
    username = "jonathan";
    homeDirectory = "/home/jonathan";

    packages = with pkgs; [
      curl
      mediainfo
      sops
      age
      fd
      ripgrep
    ];

    sessionVariables = {
      TZ = "America/Phoenix";
      DOMAIN = "wiggins.tech";
    };


    sessionPath = [ "$HOME/nix/bin" ];

    stateVersion = "22.11"; # Do not change unless you know what you're doing
  };
}
