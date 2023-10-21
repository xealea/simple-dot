#!/bin/bash

# Function to increase brightness
increase_brightness() {
  if command -v brightnessctl &> /dev/null; then
    sudo brightnessctl s +10%
  elif command -v xbacklight &> /dev/null; then
    xbacklight +10
  else
    echo "No suitable backlight control command found."
    exit 1
  fi
  show_notification "Brightness Increased" "$(get_brightness_icon)" "$(get_brightness_percentage)"
}

# Function to decrease brightness
decrease_brightness() {
  if command -v brightnessctl &> /dev/null; then
    sudo brightnessctl s 10%-
  elif command -v xbacklight &> /dev/null; then
    xbacklight -10
  else
    echo "No suitable backlight control command found."
    exit 1
  fi
  show_notification "Brightness Decreased" "$(get_brightness_icon)" "$(get_brightness_percentage)"
}

# Function to show notification using Dunst
show_notification() {
  dunstify -a "Brightness Control" -u low -r 9999 -i "$2" "$1" "$3"
}

# Function to get the appropriate brightness icon
get_brightness_icon() {
  brightness=$(get_brightness_percentage)

  if (( brightness >= 90 )); then
    echo "$HOME/.icons/ePapirus-Dark/symbolic/status/display-brightness-high-symbolic.svg"
  elif (( brightness >= 70 )); then
    echo "$HOME/.icons/ePapirus-Dark/symbolic/status/display-brightness-high-symbolic.svg"
  elif (( brightness >= 50 )); then
    echo "$HOME/.icons/ePapirus-Dark/symbolic/status/display-brightness-medium-symbolic.svg"
  elif (( brightness >= 30 )); then
    echo "$HOME/.icons/ePapirus-Dark/symbolic/status/display-brightness-medium-symbolic.svg"
  elif (( brightness >= 10 )); then
    echo "$HOME/.icons/ePapirus-Dark/symbolic/status/display-brightness-low-symbolic.svg"
  else
    echo "$HOME/.icons/ePapirus-Dark/symbolic/status/display-brightness-off-symbolic.svg"
  fi
}

# Function to get the current brightness percentage
get_brightness_percentage() {
  if command -v brightnessctl &> /dev/null; then
    brightnessctl get
  elif command -v xbacklight &> /dev/null; then
    xbacklight -get | awk '{print int($1)}'
  else
    echo "No suitable backlight control command found."
    exit 1
  fi
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

