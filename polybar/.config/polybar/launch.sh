#! /usr/bin/env sh

# Terminate already running instances of bar
killall -q polybar

# Wait until start processes are shut down
while pgrep -x polybar >/dev/null; do sleep 0.01; done

# Launch polybar
polybar topBar
