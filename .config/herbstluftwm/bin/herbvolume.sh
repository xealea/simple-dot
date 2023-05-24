#!/bin/bash

# Script by Lea
# Email: xealea@xedev.my.id

# Function to increase volume
increase_volume() {
  pactl set-sink-volume @DEFAULT_SINK@ +10%
  show_notification "Volume Increased" "$(get_volume_icon)" "$(get_volume_percentage)"
}

# Function to decrease volume
decrease_volume() {
  pactl set-sink-volume @DEFAULT_SINK@ -10%
  show_notification "Volume Decreased" "$(get_volume_icon)" "$(get_volume_percentage)"
}

# Function to mute volume
mute_volume() {
  pactl set-sink-mute @DEFAULT_SINK@ toggle
  if is_volume_muted; then
    show_notification "Volume Muted" "$HOME/.icons/ePapirus-Dark/symbolic/status/audio-volume-muted-symbolic.svg" "Muted"
  else
    show_notification "Volume Unmuted" "$(get_volume_icon)" "$(get_volume_percentage)"
  fi
}

# Function to toggle microphone mute
toggle_microphone() {
  pactl set-source-mute @DEFAULT_SOURCE@ toggle
  if is_microphone_muted; then
    show_notification "Microphone Muted" "$HOME/.icons/ePapirus-Dark/symbolic/status/microphone-sensitivity-muted-symbolic.svg" "Muted"
  else
    show_notification "Microphone Unmuted" "$HOME/.icons/ePapirus-Dark/symbolic/status/microphone-sensitivity-high-symbolic.svg" "Unmuted"
  fi
}

# Function to check if the volume is muted
is_volume_muted() {
  [[ $(pamixer --get-mute) == "true" ]]
}

# Function to check if the microphone is muted
is_microphone_muted() {
  [[ $(pamixer --get-source-mute @DEFAULT_SOURCE@) == "true" ]]
}

# Function to show notification using Dunst
show_notification() {
  dunstify -a "Volume Control" -u low -r 9999 -i "$2" "$1" "$3" "$4"
}

# Function to get the appropriate volume icon
get_volume_icon() {
  if is_volume_muted; then
    echo "audio-volume-muted-symbolic"
  else
    volume=$(pamixer --get-volume)
    if (( volume >= 90 )); then
      echo "$HOME/.icons/ePapirus-Dark/symbolic/status/audio-volume-high-symbolic.svg"
    elif (( volume >= 70 )); then
      echo "$HOME/.icons/ePapirus-Dark/symbolic/status/audio-volume-high-symbolic.svg"
    elif (( volume >= 50 )); then
      echo "$HOME/.icons/ePapirus-Dark/symbolic/status/audio-volume-medium-symbolic.svg"
    elif (( volume >= 30 )); then
      echo "$HOME/.icons/ePapirus-Dark/symbolic/status/audio-volume-medium-symbolic.svg"
    elif (( volume >= 10 )); then
      echo "$HOME/.icons/ePapirus-Dark/symbolic/status/audio-volume-low-symbolic.svg"
    else
      echo "$HOME/.icons/ePapirus-Dark/symbolic/status/audio-volume-muted-symbolic.svg"
    fi
  fi
}

# Function to get the volume percentage
get_volume_percentage() {
  pamixer --get-volume-human
}

# Parse the script arguments
case "$1" in
  --inc)
    increase_volume
    ;;
  --dec)
    decrease_volume
    ;;
  --mute)
    mute_volume
    ;;
  --microphone)
    toggle_microphone
    ;;
  *)
    echo "Usage: herbvolume.sh [--inc|--dec|--mute|--microphone]"
    exit 1
    ;;
esac

exit 0
