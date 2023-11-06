#!/usr/bin/env bash
currentTime=$(date -Iseconds)
screenshot="${HOME}/downloads/${currentTime}.png"

main() {
  for depends in grim slurp jq; do
    if ! command -v "$depends"; then
      notify-send -c screenshot -i user-trash-full error \
        "${depends} must be installed to take screenshots"
      exit 1
    fi
  done

  if [[ $1 == "fullScreen" ]]; then
    fullScreen
  elif [[ $1 == "selected" ]]; then
    selected
  elif [[ $1 == "focused" ]]; then
    focused
  fi
}

fullScreen() {
  grim "$screenshot"
  notify-send -c screenshot "Screenshot saved to ${screenshot}"
}

selected() {
  grim -g "$(slurp)" "$screenshot"
  notify-send -c screenshot "Screenshot saved to ${screenshot}"
}

focused() {
  grim -g "$(swaymsg -t get_tree |
    jq -r '.. | select(.focused?) |
    .rect | "\(.x),\(.y) \(.width)x\(.height)"')" "$screenshot"
  notify-send -c screenshot "Screenshot saved to ${screenshot}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$1"
fi
