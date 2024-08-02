#!/usr/bin/env bash
# script to run sway using distrobox
export PATH="${PATH}:$HOME/.local/bin
distrobox enter dev -- sway
