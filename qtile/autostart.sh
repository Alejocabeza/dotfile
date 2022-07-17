#!/bin/sh

# systray battery icon
cbatticon -u 5 &
# systray volume
volumeicon &
# config screen
xrandr --output HDMI-1 --mode 1366x768
