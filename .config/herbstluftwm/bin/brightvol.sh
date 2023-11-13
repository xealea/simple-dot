#!/bin/bash

# Function to display notifications with percentage
show_notification() {
  dunstify -u low -r 1234 "$1 $2%"
}

# Decrease screen brightness
decrease_brightness() {
  percentage=$(brightnessctl s 5%- | grep -oP '(\d+)%' | cut -d'%' -f1)
  show_notification "Brightness decreased" "$percentage"
}

# Increase screen brightness
increase_brightness() {
  percentage=$(brightnessctl s 5%+ | grep -oP '(\d+)%' | cut -d'%' -f1)
  show_notification "Brightness increased" "$percentage"
}

# Decrease speaker volume
decrease_speaker_volume() {
  pactl set-sink-mute @DEFAULT_SINK@ false # Unmute first
  pactl set-sink-volume @DEFAULT_SINK@ -5%
  percentage=$(pactl list sinks | grep 'Volume:' | grep -oP '(\d+)%' | head -n 1)
  show_notification "Speaker volume decreased" "$percentage"
}

# Increase speaker volume
increase_speaker_volume() {
  pactl set-sink-mute @DEFAULT_SINK@ false # Unmute first
  pactl set-sink-volume @DEFAULT_SINK@ +5%
  percentage=$(pactl list sinks | grep 'Volume:' | grep -oP '(\d+)%' | head -n 1)
  show_notification "Speaker volume increased" "$percentage"
}

# Decrease microphone volume
decrease_mic_volume() {
  pactl set-source-mute @DEFAULT_SOURCE@ false # Unmute first
  pactl set-source-volume @DEFAULT_SOURCE@ -5%
  percentage=$(pactl list sources | grep 'Volume:' | grep -oP '(\d+)%' | head -n 1)
  show_notification "Microphone volume decreased" "$percentage"
}

# Increase microphone volume
increase_mic_volume() {
  pactl set-source-mute @DEFAULT_SOURCE@ false # Unmute first
  pactl set-source-volume @DEFAULT_SOURCE@ +5%
  percentage=$(pactl list sources | grep 'Volume:' | grep -oP '(\d+)%' | head -n 1)
  show_notification "Microphone volume increased" "$percentage"
}

# Toggle mute/unmute for speaker
toggle_speaker_mute() {
  if [ "$(pactl list sinks | awk '/Mute:/ {print $2}')" == "yes" ]; then
    show_notification "Speaker audio muted" "Muted"
  else
    show_notification "Speaker audio unmuted" "Unmuted"
  fi
}

# Toggle mute/unmute for microphone
toggle_mic_mute() {
  if [ "$(pactl list sources | awk '/Mute:/ {print $2}')" == "yes" ]; then
    show_notification "Microphone audio muted" "Muted"
  else
    show_notification "Microphone audio unmuted" "Unmuted"
  fi
}

# Handle arguments
case "$1" in
  "decrease_brightness") decrease_brightness ;;
  "increase_brightness") increase_brightness ;;
  "decrease_speaker_volume") decrease_speaker_volume ;;
  "increase_speaker_volume") increase_speaker_volume ;;
  "decrease_mic_volume") decrease_mic_volume ;;
  "increase_mic_volume") increase_mic_volume ;;
  "toggle_speaker_mute") toggle_speaker_mute ;;
  "toggle_mic_mute") toggle_mic_mute ;;
  *) echo "Invalid argument" ;;
esac
