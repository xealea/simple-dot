#!/bin/bash

# This script was made by Lea
# Email: xealea@xedev.my.id
# Copyright (C) 2023 Lea <xealea@proton.me>

DIR="$HOME/.config/herbstluftwm"

time=$(date +%Y-%m-%d-%H-%M-%S)
geometry=$(xrandr | grep 'current' | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current')
dir="$(xdg-user-dir PICTURES)/Screenshots"
file="Screenshot_${time}_${geometry}.png"
temp_file="${dir}/temp_${time}.png"

# Commands
notify_cmd_shot="dunstify -u low --replace=699 -i /usr/share/icons/dunst/picture.png"
rofi_command="rofi -theme $DIR/rofi/themes/screenshot.rasi"

# Buttons
screen=""
area=""
window=""
infive=""
inten=""

# notify and view screenshot
notify_view() {
  ${notify_cmd_shot} "Copied to clipboard."
  paplay /usr/share/sounds/freedesktop/stereo/screen-capture.oga &>/dev/null &
  viewnior "${dir}/${file}"
  if [[ -e "${dir}/${file}" ]]; then
    ${notify_cmd_shot} "Screenshot Saved."
  else
    ${notify_cmd_shot} "Screenshot Deleted."
  fi
}

# Copy screenshot to clipboard
copy_shot() {
  xclip -selection clipboard -t image/png < "${dir}/${file}"
}

# countdown
countdown() {
  for sec in $(seq "$1" -1 1); do
    dunstify -t 1000 --replace=699 -i /usr/share/icons/dunst/timer.png "Taking shot in: $sec"
    sleep 1
  done
}

#convert img with shadow
convert_image() {
  convert "$1" \
    \( +clone -background black -shadow 25x30+0+0 \) \
    +swap -background '#637e92' -layers merge \
    "${dir}/${file}"
}

# take shots
shotnow() {
  cd "$dir" && sleep 0.5 && maim -u -f png > "$temp_file"
  convert_image "$temp_file"
  rm "$temp_file"
  notify_view
}

shot5() {
  countdown 5
  sleep 1 && cd "$dir" && maim -u -f png > "$temp_file"
  convert_image "$temp_file"
  rm "$temp_file"
  notify_view
}

shot10() {
  countdown 10
  sleep 1 && cd "$dir" && maim -u -f png > "$temp_file"
  convert_image "$temp_file"
  rm "$temp_file"
  notify_view
}

shotwin() {
  cd "$dir" && maim -u -f png -i "$(xdotool getactivewindow)" > "$temp_file"
  convert_image "$temp_file"
  rm "$temp_file"
  notify_view
}

shotarea() {
  cd "$dir" && maim -u -f png -s -b 2 -c 0.35,0.55,0.85,0.25 > "$temp_file"
  convert_image "$temp_file"
  rm "$temp_file"
  notify_view
}

if [[ ! -d "$dir" ]]; then
  mkdir -p "$dir"
fi

# execute
if [[ "$1" == "--now" ]]; then
  shotnow
elif [[ "$1" == "--in5" ]]; then
  shot5
elif [[ "$1" == "--in10" ]]; then
  shot10
elif [[ "$1" == "--win" ]]; then
  shotwin
elif [[ "$1" == "--area" ]]; then
  shotarea
else
  echo -e "Available Options : --now --in5 --in10 --win --area"
fi

exit 0
