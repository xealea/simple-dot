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

# Function to toggle mute volume
toggle_mute_volume() {
  pactl set-sink-mute @DEFAULT_SINK@ toggle
  if is_volume_muted; then
    show_notification "Volume Muted" "audio-volume-muted-symbolic" "Muted"
  else
    show_notification "Volume Unmuted" "$(get_volume_icon)" "$(get_volume_percentage)"
  }
}

# Function to toggle microphone mute
toggle_microphone() {
  pactl set-source-mute @DEFAULT_SOURCE@ toggle
  if is_microphone_muted; then
    show_notification "Microphone Muted" "microphone-sensitivity-muted-symbolic" "Muted"
  else
    show_notification "Microphone Unmuted" "microphone-sensitivity-high-symbolic" "Unmuted"
  }
}

# Function to check if the volume is muted
is_volume_muted() {
  [[ $(pactl list sinks | grep 'Mute: yes') ]]
}

# Function to check if the microphone is muted
is_microphone_muted() {
  [[ $(pactl list sources | grep 'Mute: yes') ]]
}

# Function to show notification using Dunst
show_notification() {
  dunstify -a "Volume Control" -u low -r 9999 -i "$2" "$1" "$3"
}

# Function to get the appropriate volume icon
get_volume_icon() {
  if is_volume_muted; then
    echo "audio-volume-muted-symbolic"
  else
    volume=$(pactl list sinks | grep 'Volume:' | head -n 1 | awk '{print $5}' | tr -d '%')
    if (( volume >= 90 )); then
      echo "audio-volume-high-symbolic"
    elif (( volume >= 70 )); then
      echo "audio-volume-high-symbolic"
    elif (( volume >= 50 )); then
      echo "audio-volume-medium-symbolic"
    elif (( volume >= 30 )); then
      echo "audio-volume-medium-symbolic"
    elif (( volume >= 10 )); then
      echo "audio-volume-low-symbolic"
    else
      echo "audio-volume-muted-symbolic"
    fi
  }
}

# Function to get the volume percentage
get_volume_percentage() {
  pactl list sinks | grep 'Volume:' | head -n 1 | awk '{print $5}'
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
    toggle_mute_volume
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
