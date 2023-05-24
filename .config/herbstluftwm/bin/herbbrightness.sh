#!/bin/bash

# Script by Lea
# Email: xealea@xedev.my.id

# Function to increase brightness
increase_brightness() {
  brightnessctl s +10%
  show_notification "Brightness Increased" "$(get_brightness_icon)" "$(get_brightness_percentage)"
}

# Function to decrease brightness
decrease_brightness() {
  brightnessctl s 10%-
  show_notification "Brightness Decreased" "$(get_brightness_icon)" "$(get_brightness_percentage)"
}

# Function to show notification using Dunst
show_notification() {
  dunstify -a "Brightness Control" -u low -r 9999 -i "$2" "$1" "$3"
}

# Function to get the appropriate brightness icon
get_brightness_icon() {
  brightness=$(brightnessctl g)
  max_brightness=$(brightnessctl m)
  percentage=$(( brightness * 100 / max_brightness ))

  if (( percentage >= 90 )); then
    echo "$HOME/.icons/ePapirus-Dark/symbolic/status/display-brightness-high-symbolic.svg"
  elif (( percentage >= 70 )); then
    echo "$HOME/.icons/ePapirus-Dark/symbolic/status/display-brightness-high-symbolic.svg"
  elif (( percentage >= 50 )); then
    echo "$HOME/.icons/ePapirus-Dark/symbolic/status/display-brightness-medium-symbolic.svg"
  elif (( percentage >= 30 )); then
    echo "$HOME/.icons/ePapirus-Dark/symbolic/status/display-brightness-medium-symbolic.svg"
  elif (( percentage >= 10 )); then
    echo "$HOME/.icons/ePapirus-Dark/symbolic/status/display-brightness-low-symbolic.svg"
  else
    echo "$HOME/.icons/ePapirus-Dark/symbolic/status/display-brightness-off-symbolic.svg"
  fi
}

# Function to get the brightness percentage
get_brightness_percentage() {
  brightness=$(brightnessctl g)
  max_brightness=$(brightnessctl m)
  percentage=$(( brightness * 100 / max_brightness ))
  echo "$percentage%"
}

# Parse the script arguments
case "$1" in
  --inc)
    increase_brightness
    ;;
  --dec)
    decrease_brightness
    ;;
  *)
    echo "Usage: herbbrightness.sh [--inc|--dec]"
    exit 1
    ;;
esac

exit 0
