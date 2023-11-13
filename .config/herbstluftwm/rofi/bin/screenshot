#!/bin/bash

# This script was made by Lea
# Email: xealea@xedev.my.id
# Copyright © 2023 Lea <xealea@proton.me>

# Configuration
DIR="$HOME/.config/herbstluftwm"
NOTIFY_ICON="/usr/share/icons/dunst/picture.png"
TIMER_ICON="/usr/share/icons/dunst/timer.png"
ROFI_THEME="$DIR/rofi/themes/screenshot.rasi"

# Functions
notify() {
  dunstify -u low --replace=699 -i "$NOTIFY_ICON" "$1"
}

countdown() {
  for ((sec = $1; sec > 0; sec--)); do
    notify "Taking shot in: $sec"
    sleep 1
  done
}

convert_image() {
  convert "$1" \( +clone -background black -shadow 25x30+0+0 \) +swap -background '#b6beca' -layers merge "$2"
}

take_screenshot() {
  maim -u -f png "$1"
}

# Main
time=$(date +%Y-%m-%d-%H-%M-%S)
geometry=$(xrandr --current | awk '/current/ {print $8}')
dir="$(xdg-user-dir PICTURES)/Screenshots"
file="Screenshot_${time}_${geometry}.png"
temp_file="${dir}/temp_${time}.png"

if [[ ! -d "$dir" ]]; then
  mkdir -p "$dir"
fi

case "$1" in
  --now)
    take_screenshot "$dir/$temp_file" && convert_image "$dir/$temp_file" "$dir/$file" && notify "Copied to clipboard." && notify_view "$dir/$file"
    ;;
  --in5)
    countdown 5 && take_screenshot "$dir/$temp_file" && convert_image "$dir/$temp_file" "$dir/$file" && notify_view "$dir/$file"
    ;;
  --in10)
    countdown 10 && take_screenshot "$dir/$temp_file" && convert_image "$dir/$temp_file" "$dir/$file" && notify_view "$dir/$file"
    ;;
  --win)
    take_screenshot "$dir/$temp_file" -i "$(xdotool getactivewindow)" && convert_image "$dir/$temp_file" "$dir/$file" && notify_view "$dir/$file"
    ;;
  --area)
    take_screenshot "$dir/$temp_file" -s -b 2 -c 0.35,0.55,0.85,0.25 && convert_image "$dir/$temp_file" "$dir/$file" && notify_view "$dir/$file"
    ;;
  *)
    echo "Available Options: --now --in5 --in10 --win --area"
    exit 1
    ;;
esac

exit 0
