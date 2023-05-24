#!/usr/bin/env bash

set -e

################################################################################
# Script: dotfiles_install.sh
# Description: Script to install or update dotfiles from the repository.
# Author: Lea <xealea@proton.me>
# Copyright (C) 2023 Lea <xealea@proton.me>
# Repository: https://github.com/xealea/simple-dot
################################################################################

# Set the repository URL and destination directory
repository="https://github.com/xealea/simple-dot"
destination="$HOME/simple-dot"

# Function to check if the repository is already available
is_repository_available() {
    [ -d "$destination" ] && [ -d "$destination/.git" ]
}

# Function to update the dotfiles repository
update_repository() {
    echo "Updating the dotfiles repository..."
    cd "$destination"
    git pull
}

# Display greeting message
echo "Hello there! These dotfiles are made by @Lea."
echo "You are now in the installation step."
echo ""

# Check if the repository is already available
if is_repository_available; then
    echo "The dotfiles repository is already available in $destination."

    # Prompt for confirmation to update the dotfiles
    read -p "Do you want to update the dotfiles repository? (y/n) " confirm

    # Check if the user wants to update the repository
    if [[ "$confirm" = "y" ]]; then
        update_repository
    else
        echo "Installation aborted. Exiting..."
        exit 0
    fi
else
    # Prompt for confirmation to clone the dotfiles repository
    read -p "Do you want to clone the dotfiles repository? (y/n) " confirm

    # Check if the user wants to clone the repository
    if [[ "$confirm" != "y" ]]; then
        echo "Installation aborted. Exiting..."
        exit 0
    fi

    # Clone the repository to the destination directory
    git clone --depth 1 "$repository" "$destination"
fi

# Calculate and display the size of each folder or file
calculate_size() {
    local path="$1"
    if [[ -e "$path" ]]; then
        local size
        size=$(du -sh "$path" | awk '{print $1}')
        local name
        name=$(basename "$path")
        printf "%-10s %s\n" "$size" "$name"
    else
        echo "du: cannot access '$path': No such file or directory"
        echo "           $(basename "$path")"
    fi
}

echo "Folder/File sizes:"
echo "------------------"
calculate_size "$destination"
calculate_size "$destination/.config"
calculate_size "$destination/.fehbg"
calculate_size "$destination/.fonts"
calculate_size "$destination/.icons"
calculate_size "$destination/.themes"
calculate_size "$destination/.wall"
calculate_size "$destination/.xsettingsd"

# Prompt for confirmation to continue
read -p "Do you want to copy the dotfiles? (y/n) " confirm

# Copy folders/files to the destination directory
if [[ "$confirm" = "y" ]]; then
    # Copy dotfiles to the destination directory
    rsync -a --exclude=".git" --exclude="README-ID.md" --exclude="README-EN.md" --exclude="README.md" --exclude="dotfiles_install.sh" "$destination/" "$HOME"

    # Place the LICENSE file in $HOME/.config directory
    cp "$HOME/LICENSE" "$HOME/.config/LICENSE-SIMPLE-DOT"
    
    # Set Nemo default terminal to Alacritty
    gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty

    # Display success message
    echo "Copying completed successfully!"
    echo ""

    # Extract Fonts from $HOME/.fonts directory
    echo "Extracting Fonts..."
    tar -xf "$HOME/.fonts/glyph-font.tar.xz" -C "$HOME/.fonts"
    echo "Fonts extracted."

    # Remove the tar.xz file
    rm "$HOME/.fonts/glyph-font.tar.xz"
    echo "glyph-font.tar.xz deleted."
    echo ""

    # Extract GTK theme from $HOME/.themes directory
    echo "Extracting GTK theme..."
    tar -xf "$HOME/.themes/amarena-gtk.tar.xz" -C "$HOME/.themes"
    echo "GTK theme extracted."

    # Remove the tar.xz file
    rm "$HOME/.themes/amarena-gtk.tar.xz"
    echo "amarena-gtk.tar.xz deleted."
    echo ""

    # Extract icons from $HOME/.icons directory
    echo "Extracting icons..."
    tar -xf "$HOME/.icons/amarena-icons.tar.xz" -C "$HOME/.icons"
    echo "Icons extracted."

    # Remove the tar.xz file
    rm "$HOME/.icons/amarena-icons.tar.xz"
    echo "amarena-icons.tar.xz deleted."
    echo ""

    # Prompt to refresh font cache
    read -p "Do you want to refresh the font cache? (y/n) " refresh

    # Refresh font cache if selected
    if [[ "$refresh" = "y" ]]; then
        echo "Running fc-cache..."
        fc-cache -r
    fi
    echo ""

    # Set shell to fish shell
    echo "Setting the shell to fish shell..."
    chsh -s "$(command -v fish)"

    echo "Installation completed!"
else
    echo "Installation aborted. Exiting..."
    exit 0
fi
