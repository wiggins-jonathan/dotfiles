export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/podman/bin:$PATH
# run xhost if not in podman container. This allows GUI apps to work
if [[ ! -e /run/.containerenv ]]; then
  xhost +si:localuser:$USER > /dev/null
fi

# if command does not exist in container, try to run it using host
command_not_found_handle() {
  # if not in container just run command
  if [[ ! -e /run/.containerenv ]]; then
    "$@"
  fi

  distrobox-host-exec "$@"
}

# only run if in zsh
if [[ -n "$ZSH_VERSION" ]]; then
  command_not_found_handler() {
    command_not_found_handle "$@"
  }
fi

