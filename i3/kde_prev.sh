#/bin/bash
DEV=$(playerctl -l | grep kde)
playerctl -p $DEV previous
