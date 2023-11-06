Repository for declarative Linux configuration files.
Fully atomic, hermetic, & modular using
[nix](https://nixos.org) &
[home-manager](https://github.com/nix-community/home-manager)

## Installation
- Clone repo
    * `git clone git@gitlab.com:wiggins.jonathan/dotfiles.git`
- Symlink configuration to /etc/nixos:
    * `sudo ln -s $(realpath flake.nix) /etc/nixos/flake.nix`
- Update nixos
    * `sudo nixos-rebuild switch`
