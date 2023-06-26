#!/usr/bin/env bash
# script to run sway using distrobox
export PATH="${PATH}:$HOME/.local/bin:$HOME/.local/podman/bin"
distrobox enter dev -- sway
