#!/bin/bash

# Copy the sddm theme to /usr/share/ with sudo
echo "Copying sddm theme to /usr/share/..."
sudo cp -r $HOME/simple-dot/misc/sddm/ /usr/share/

# Run sddm-greeter with the theme from /usr/share/sddm/themes/decay
sddm-greeter --theme /usr/share/sddm/themes/decay

# Install the sddm theme with sddmthemeinstaller using sudo
echo "Installing the sddm theme..."
sudo sddmthemeinstaller -i /usr/share/sddm/themes/decay

# Copy the sddm configuration to /etc/ with sudo
echo "Copying sddm configuration to /etc/..."
sudo cp $HOME/simple-dot/misc/sddm.conf.d/sddm.conf /etc/

# Restart sddm with the updated configuration using sudo
echo "Restarting sddm..."
sudo sddm /etc/sddm.conf

