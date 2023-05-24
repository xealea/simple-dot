#!/usr/bin/env bash

# This script was modified by Lea based from archcraft script
# Email: xealea@xedev.my.id

rofi -dmenu \
     -password \
     -i \
     -no-fixed-num-lines \
     -p "User Password: " \
     -theme ~/.config/herbstluftwm/rofi/themes/askpass.rasi &
