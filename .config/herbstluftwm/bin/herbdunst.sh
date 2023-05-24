#!/usr/bin/env bash

# This script was modified by Lea based from archcraft script
# Email: xealea@xedev.my.id

## Launch dunst daemon
if [[ `pidof dunst` ]]; then
	pkill dunst
fi

dunst -config ~/.config/herbstluftwm/dunstrc &
