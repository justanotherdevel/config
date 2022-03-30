#!/bin/bash
# suspend message display
#pkill -u "$USER" -USR1 dunst
dunstclt set-paused true

# lock the screen
i3lock -n -ti ~/.lock.png

# resume message display
#pkill -u "$USER" -USR2 dunst
dunstctl set-paused false
