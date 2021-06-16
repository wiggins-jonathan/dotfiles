#!/usr/bin/env bash
currentVolume=$(pamixer --get-volume)

main() {
  if ! command -v pamixer; then
    notify-send -c volume -i user-trash-full error \
      "pamixer must be installed for volume notifications"
    exit 1
  fi

  if [[ $1 == "mute" ]]; then
    mute
  elif [[ $1 == "down" ]]; then
    volumeDown
  elif [[ $1 == "up" ]]; then
    volumeUp
  fi
}

mute() {
  if [[ $(pamixer --get-mute) == false ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    makoctl dismiss -g
    notify-send -c volume  "Mute"
    exit 0
  fi

  pactl set-sink-mute @DEFAULT_SINK@ toggle
  makoctl dismiss -g
  notify-send -c volume  "Unmute :: $currentVolume%"
}

volumeDown() {
  # Needed for displaying when volume is already at 0
  if [[ $currentVolume -le 0 ]]; then
    makoctl dismiss -g
    notify-send -c volume  "$currentVolume%"
    exit 0
  fi

  pactl set-sink-volume @DEFAULT_SINK@ -5%
  makoctl dismiss -g
  currentVolume=$(( currentVolume - 5 ))
  notify-send -c volume  "$currentVolume%"
}

volumeUp() {
  pactl set-sink-volume @DEFAULT_SINK@ +5%
  makoctl dismiss -g
  currentVolume=$(( currentVolume + 5 ))
  notify-send -c volume $volumeIcon "$currentVolume%"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main $1
fi
