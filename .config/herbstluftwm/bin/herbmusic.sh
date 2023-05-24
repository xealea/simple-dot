#!/usr/bin/env bash

# This script was modified by Lea based from archcraft script
# Email: xealea@xedev.my.id

## directory
DIR="$HOME/.config/herbstluftwm"

CONFIG="$DIR/alacritty/alacritty.yml"

alacritty --class 'Music,Music' --config-file "$CONFIG" \
		  -o window.dimensions.columns=109 window.dimensions.lines=22 \
		  -e ~/.ncmpcpp/scripts/ncmpcpp-art
