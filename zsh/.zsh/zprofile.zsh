# Set environment variables
export MOZ_ENABLE_WAYLAND=1       # Required for firefox in sway
export EDITOR="/usr/bin/nvim"
export VISUAL=$EDITOR

# PATH
PATH=$PATH:$HOME/.go/bin
PATH=$PATH:$HOME/bin

# Load sway on login if tty1
if [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi
