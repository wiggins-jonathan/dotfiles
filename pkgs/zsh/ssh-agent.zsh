# Run ssh agent if not running. Key is good for 1 day.
# This requires `AddKeysToAgent yes` in ~/.ssh/config
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent -t 1d > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
  source "$XDG_RUNTIME_DIR/ssh-agent.env" > /dev/null
fi

# set to avoid conflicts with ssh'ing to machines without ghostty
if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
    export TERM=xterm-256color
fi
