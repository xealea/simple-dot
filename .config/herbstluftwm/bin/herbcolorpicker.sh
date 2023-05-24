#!/usr/bin/env bash

# This script was modified by Lea based from archcraft script
# Email: xealea@xedev.my.id

## Simple script to pick color quickly.
color=$(xcolor --format hex --preview-size 255 --scale 10)

main() {
    if [[ $color ]]; then
        # copy color code to clipboard
        printf '%s' "$color" | xclip -selection clipboard

        # generate preview
        convert -size 48x48 xc:"$color" /tmp/"$color.png"

        # create block image with selected color
        block_image=$(echo -e "\xE2\xAE\xB4" | sed "s/#/$color/g")

        # notify about it
        dunstify -u low -h string:x-dunst-stack-tag:obcolorpicker "$block_image $color"
    fi
}

# run the script
main

