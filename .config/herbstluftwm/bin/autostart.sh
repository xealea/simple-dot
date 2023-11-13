#!/bin/bash

# This script was modified by Lea based from archcraft script
# Email: xealea@xedev.my.id

# Kill already running processes
processes=("picom" "dunst" "ksuperkey" "mpd" "xfce-polkit" "xfce4-power-manager")
for process in "${processes[@]}"; do
	if pidof "$process" > /dev/null; then
		pkill "$process"
	fi
done

# Fix cursor
xsetroot -cursor_name left_ptr

# Polkit agent
/usr/lib/xfce-polkit/xfce-polkit &

# Enable power management
xfce4-power-manager &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' && ksuperkey -e 'Super_R=Alt_L|F1' &

# Set/Restore wallpaper
~/.fehbg &

# Launch notification daemon, polybar, and compositor
herbst_scripts=~/.config/herbstluftwm/bin
herbdunst="$herbst_scripts/herbdunst.sh"
$herbdunst &

# Automatic lockscreen
herbxlock="$herbst_scripts/herbxss.sh"
$herbxlock &

# Pipewire
dbus-run-session pipewire &

# Start mpd
mpd &

# Some env
export QT_QPA_PLATFORMTHEME=qt5ct
