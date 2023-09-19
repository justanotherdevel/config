# export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_STYLE_OVERRIDE=kvantum

if [[ ! $WAYLAND_DISPLAY && ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
