Special repository for Linux configuration files used on raspberry pi.
Use [Git](https://git-scm.com/) & [GNU Stow](https://www.gnu.org/software/stow/) to quickly deploy.

## Dependencies
* [zsh](https://www.zsh.org/)
* [termite](https://github.com/thestinger/termite)
* [neofetch](https://github.com/dylanaraps/neofetch)
* [numlockx](https://github.com/rg3/numlockx)
* [neovim](https://github.com/neovim/neovim)
* [Tmux](gnu://github.com/tmux/tmux/wiki)

## How to Install

### 1. Clone repo
`$ git clone git@github.com:wiggins-jonathan/dotfiles.git`

### 2. Run installer.sh
installer.sh will use stow to symlink all folders in the repo to $HOME.

`$ ./install.sh`
