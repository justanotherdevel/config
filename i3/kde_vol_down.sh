#/bin/bash
DEV=$(playerctl -l | grep kde)
playerctl -p $DEV volume 0.05-
