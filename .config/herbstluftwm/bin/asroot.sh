#!/usr/bin/env bash

# This script was modified by Lea based from archcraft script
# Email: xealea@xedev.my.id

## rofi sudo askpass helper
export SUDO_ASKPASS=~/.config/herbstluftwm/bin/askpass.sh

## execute the application
sudo -A $1
