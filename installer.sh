#!/usr/bin/env bash

# Get absolute path of this script & change to that dir.
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir

# Loop through all directories in the script's path, checks if they are
# directories, & stows them. This ignores hidden directories.
for directory in */; do
  if [[ -d "$directory" ]]; then
    ( stow "$directory" )
  fi
done
