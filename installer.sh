#!/usr/bin/env bash

#===========================================================#
#       _            __        ____                 __      #
#      (_)___  _____/ /_____ _/ / /__  _____  _____/ /_     #
#     / / __ \/ ___/ __/ __ `/ / / _ \/ ___/ / ___/ __ \    #
#    / / / / (__  ) /_/ /_/ / / /  __/ /  _ (__  ) / / /    #
#   /_/_/ /_/____/\__/\__,_/_/_/\___/_/  (_)____/_/ /_/     #
#                                                           #
#===========================================================#

# Get absolute path of this script & change to that dir.
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir

# Loop through all directories in the scripts path, checks if they are indeed
# directories, & stows them
for directory in */; do
  if [[ -d "$directory" ]]; then
    ( stow "$directory" )
  fi
done
