export MOZ_ENABLE_WAYLAND=1 # Required for firefox in sway
export EDITOR="/usr/bin/nvim"
export VISUAL=$EDITOR
export TERM=xterm-256color  # required for ssh compatibility

# PATH
export GOPATH=$HOME/.go
PATH=$GOPATH/bin:$PATH
PATH=$HOME/.local/bin:$PATH
PATH=$HOME/bin:$PATH

# Run ssh agent if not running. Key is good for 1 day.
# This requires `AddKeysToAgent yes` in ~/.ssh/config
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent -t 1d > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
  source "$XDG_RUNTIME_DIR/ssh-agent.env" > /dev/null
fi

# Load sway on login if tty1
if [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi
