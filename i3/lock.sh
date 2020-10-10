#!/bin/bash
# suspend message display
#pkill -u "$USER" -USR1 dunst
notify-send DUNST_COMMAND_PAUSE

# lock the screen
i3lock -n -ti ~/.lock.png

# resume message display
#pkill -u "$USER" -USR2 dunst
notify-send DUNST_COMMAND_RESUME
