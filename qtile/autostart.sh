#!/bin/sh

# Some ways to set your wallpaper besides variety or nitrogen
feh --bg-fill $HOME/dotfile/wallpapers/wallpaper1.jpg &

# Start the conky to learn the shortcuts
# (conky -c $HOME/dotfile/qtile/scripts/system-overview)

# Start sxhkd to replace qtile native key-bindings
# sxhkd -c ~/doctfile/qtile/sxhkd/sxhkdrc &

# Starting utility applications at boot time
variety &
nm-applet &
# pamac-tray &
xfce4-power-manager &
# numlockx on &
blueberry-tray &
picom --config $HOME/.config/qtile/scripts/picom.conf &

# systray battery icon
cbatticon -u 5 &

# systray volume
volumeicon &
