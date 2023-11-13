#!/bin/bash

# This script was made by Lea
# Email: xealea@xedev.my.id
# Copyright © 2023 Lea <xealea@proton.me>

# Constants
CONFIG_DIR="$HOME/.config/herbstluftwm"
SCREENSHOT_DIR="$(xdg-user-dir PICTURES)/Screenshots"
NOTIFY_ICON="/usr/share/icons/dunst/picture.png"
TIMER_ICON="/usr/share/icons/dunst/timer.png"
SOUND_FILE="/usr/share/sounds/freedesktop/stereo/screen-capture.oga"

# Variables
TIME=$(date +%Y-%m-%d-%H-%M-%S)
GEOMETRY=$(xrandr | grep 'current' | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current')
FILE="Screenshot_${TIME}_${GEOMETRY}.png"
TEMP_FILE="${SCREENSHOT_DIR}/temp_${TIME}.png"
NOTIFY_CMD_SHOT="dunstify -u low --replace=699 -i $NOTIFY_ICON"
ROFI_COMMAND="rofi -theme $CONFIG_DIR/rofi/themes/screenshot.rasi"

# Functions
countdown() {
    for sec in $(seq "$1" -1 1); do
        dunstify -t 1000 --replace=699 -i $TIMER_ICON "Taking shot in: $sec"
        sleep 1
    done
}

convert_image() {
    convert "$1" \( +clone -background black -shadow 25x30+0+0 \) +swap -background '#b6beca' -layers merge "$2"
}

notify_view() {
    $NOTIFY_CMD_SHOT "Copied to clipboard."
    paplay $SOUND_FILE &>/dev/null &
    viewnior "$SCREENSHOT_DIR/$FILE"
    if [[ -e "$SCREENSHOT_DIR/$FILE" ]]; then
        $NOTIFY_CMD_SHOT "Screenshot Saved."
    else
        $NOTIFY_CMD_SHOT "Screenshot Deleted."
    fi
}

# Create screenshot directory if not exists
if [[ ! -d "$SCREENSHOT_DIR" ]]; then
    mkdir -p "$SCREENSHOT_DIR" || { echo "Error creating directory."; exit 1; }
fi

# Main execution
case "$1" in
    "--now") shotnow ;;
    "--in5") shot_with_countdown 5 ;;
    "--in10") shot_with_countdown 10 ;;
    "--win") shotwin ;;
    "--area") shotarea ;;
    *) echo -e "Available Options : --now --in5 --in10 --win --area" ;;
esac

exit 0
