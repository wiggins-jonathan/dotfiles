#!/usr/bin/env bash

set -euo pipefail

if ! command -v stow &> /dev/null; then # error out if stow is not installed
  echo "stow must be installed to run this script"
  exit 1
fi

# Loop through all directories in the script's path, checks if they are
# directories, & stows them. This ignores hidden directories.
function _stow() {

  # Get absolute path of this script & change to that dir.
  dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  cd "$dir" || echo "ERROR: Can't change to the script directory & stow" && exit 1

  for directory in */; do
    if [[ -d "$directory" ]]; then
      ( stow "$directory" )
    fi
  done
}

main() {
  _stow
}
main "$@"
