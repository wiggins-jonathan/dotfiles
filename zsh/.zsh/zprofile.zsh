# Load sway on login if tty1
if [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi

export PATH=$PATH:$HOME/.go/bin
export MOZ_ENABLE_WAYLAND=1 # required for Firefox
