# Set environment variables
export MOZ_ENABLE_WAYLAND=1       # Required for firefox in sway
export EDITOR="/usr/bin/nvim"
export VISUAL=$EDITOR

# PATH
PATH=$PATH:$HOME/.go/bin
PATH=$PATH:$HOME/bin

# Unlock the ssh key once every hour instead of on every use
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" > /dev/null
fi

# Load sway on login if tty1
if [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi
