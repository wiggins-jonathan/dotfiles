{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "deck";
  home.homeDirectory = "/home/deck";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    curl
    mediainfo
    sops
    age
    fd
    ripgrep
    xclip
    tgpt
    android-tools

    # the following requires nixgl
    nixgl.nixGLMesa
    mpv
  ];

  home.shellAliases = {
    "ll"   = "ls -lAhNv --color=auto --group-directories-first";
    "ip"   = "ip --color=auto";
    "grep" = "grep --color=auto";
    "diff" = "diff --color=auto";

    # nixgl wrappers
    "ghostty" = "nixGLMesa ghostty";
    "mpv"     = "nixGLMesa mpv";
  };
}
