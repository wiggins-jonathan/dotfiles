#!/usr/bin/env bash

reset="\033[0m"
black="\033[30m"
red="\033[31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"
magenta="\033[35m"
cyan="\033[36m"
grey="\033[37m"
white="\033[97m"

main() {
  getOS
  getCPU
  getKernel
  getShell
  getTerm
  getNumPackages
  # Loop through variables & check if they are empty & if they are set error

  echo -e $green"os      $reset : $os"
  echo -e $green"cpu     $reset : $cpu"
  echo -e $green"kernel  $reset : $kernel"
  echo -e $green"shell   $reset : $shell"
  echo -e $green"term:   $reset : $term"
  echo -e $green"packages$reset : $packages"

  # Print color triangles
  echo -e $red""$reset $green""$reset $yellow""$reset $blue""$reset\
  $magenta""$reset $cyan""$reset $grey""$reset $white""$reset
}

getOS() {
  if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    os=$NAME
  else
    os="ERROR: Can't find OS"
  fi
}

getCPU() {
  # We pipe to xargs at the end to trim whitespace
  cpu=$(lscpu | grep "Model name" | awk -F ":" '{print $2}' | xargs)
}

getKernel() {
  kernel=$(uname -r)
}

getShell() {
  shell=$(echo $SHELL | awk -F "/" '{print $4}')
}

getTerm() {
  term=$TERM
}

getNumPackages() {
  packages=$(pacman -Q | wc -l)
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main
fi
