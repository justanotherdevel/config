if [[ ! $WAYLAND_DISPLAY && ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
