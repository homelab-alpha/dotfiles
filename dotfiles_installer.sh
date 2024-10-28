#!/bin/bash

# Script Name: dotfiles_installer.sh
# Author: GJS (homelab-alpha)
# Date: 2024-10-28T08:21:31+01:00
# Version: 1.1.0

# Description:
# This script manages the installation and uninstallation of dotfiles. It backs
# up existing dotfiles before installing new ones and can restore backups during
# uninstallation. The script checks if Git is installed, as it is necessary for
# managing dotfiles repositories.

# Usage:
# Options and arguments:
# - The script presents a menu to choose between installing and uninstalling dotfiles.
# - Follow the on-screen prompts to complete the desired action.

# Examples:
# - To install dotfiles: Run the script and select "Install dotfiles".
# - To uninstall dotfiles: Run the script and select "Uninstall dotfiles".

# Notes:
# - Ensure that Git is installed on your system before running the script.
# - The script assumes that the dotfiles directory is located at $HOME/dotfiles.

# Function to check if Git is installed
check_git() {
    if ! command -v git &>/dev/null; then
        echo "Git is not installed. Please install Git before running this script."
        exit 1
    fi
}

# Function to create a backup directory and backup files
create_backup() {
    local backup_dir="$HOME/dotfiles_backup/before_installation"
    mkdir -p "$backup_dir"

    # Loop through each file and check if it exists before copying
    for file in ~/.bash_* ~/.bash-* ~/.bashrc ~/.gitconfig ~/.nano ~/.nanorc ~/.profile ~/.selected_editor ~/.tmux.conf ~/.vimrc ~/.zshrc; do
        if [ -e "$file" ]; then
            cp -r "$file" "$backup_dir" || {
                echo "Error: Unable to create backup for $file" >&2
                exit 1
            }
            echo "Backup created for $file"
        else
            echo "Skipping $file as it does not exist"
        fi
    done
    echo "Backup completed at: $backup_dir"
}

# Function to install dotfiles
# Copy all files starting with .bash_ from dotfiles directory to home directory
install_dotfiles() {

    if [ -d "$HOME/dotfiles/dotfiles" ]; then

        find "$HOME/dotfiles/dotfiles" -name '.bash_*' -exec cp {} "$HOME" \; &&
            cp "$HOME/dotfiles/dotfiles/.bashrc" "$HOME" &&
            cp "$HOME/dotfiles/dotfiles/.gitconfig" "$HOME" &&
            cp "$HOME/dotfiles/dotfiles/.nanorc" "$HOME" &&
            cp "$HOME/dotfiles/dotfiles/.selected_editor" "$HOME" &&
            cp "$HOME/dotfiles/dotfiles/.tmux.conf" "$HOME" &&
            cp "$HOME/dotfiles/dotfiles/.vimrc" "$HOME" &&
            cp "$HOME/dotfiles/dotfiles/.zshrc" "$HOME" &&
            cp -r "$HOME/dotfiles/.bash-script" "$HOME" &&
            cp -r "$HOME/dotfiles/.nano" "$HOME" &&
            if [ ! -d "$HOME/.versioning" ]; then
                mkdir "$HOME/.versioning"
            fi

        rm -rf "$HOME/dotfiles/.git" "$HOME/dotfiles/.github" "$HOME/dotfiles/.gitignore"

        echo "dotfiles successfully installed"

    else
        echo "Error: dotfiles directory not found" >&2
        exit 1
    fi
}

# Function to backup files before uninstallation
backup_files() {
    local backup_dir="$HOME/dotfiles_backup/before_uninstallation"
    mkdir -p "$backup_dir"

    # Loop through each file and check if it exists before copying
    for file in ~/.bash_* ~/.bash-* ~/.bashrc ~/.gitconfig ~/.nano ~/.nanorc ~/.profile ~/.selected_editor ~/.tmux.conf ~/.vimrc ~/.zshrc; do
        if [ -e "$file" ]; then
            cp -r "$file" "$backup_dir" || {
                echo "Error: Unable to create backup for $file" >&2
                exit 1
            }
            echo "Backup created for $file"
        else
            echo "Skipping $file as it does not exist"
        fi
    done
    echo "Backup completed at: $backup_dir"
}

# Function to remove dotfiles
remove_dotfiles() {
    rm -rf ~/.bash_* ~/.bash-* ~/.bashrc ~/.gitconfig ~/.nano ~/.nanorc ~/.profile ~/.selected_editor ~/.tmux.conf ~/.vimrc ~/.zshrc ||
        {
            echo "Error: Unable to remove dotfiles" >&2
            return 1
        }
    echo "dotfiles successfully removed"
}

# Function to restore backup files
restore_backup() {
    local backup_dir="$HOME/dotfiles_backup/before_installation"
    cp -a "$backup_dir"/. "$HOME" || {
        echo "Error: Unable to restore backup" >&2
        exit 1
    }
    echo "Backup successfully restored"
}

# Main function for installation
install() {
    create_backup &&
        install_dotfiles &&
        echo "$(date '+%Y-%m-%d %H:%M:%S') - dotfiles installation completed" >>"$HOME/dotfiles.log" &&
        echo "Installation completed. Check dotfiles_installation.log for details."
}

# Main function for uninstallation
uninstall() {
    if backup_files &&
        remove_dotfiles &&
        sleep 0.5 &&
        restore_backup; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - dotfiles uninstallation completed" >>"$HOME/dotfiles.log"
        echo "Uninstallation completed. Check dotfiles_installation.log for details."
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') - dotfiles uninstallation encountered errors" >>"$HOME/dotfiles.log"
        echo "Uninstallation encountered errors. Check dotfiles_installation.log for details."
    fi
    sleep 0.5
    rm -rf ~/dotfiles
}

# Display menu for action selection
echo "Welcome to the dotfiles installation/uninstallation tool"
echo "1. Install dotfiles"
echo "2. Uninstall dotfiles"
read -r -p "Enter your choice: " choice
if [ "$choice" == "1" ]; then
    check_git
    install
elif [ "$choice" == "2" ]; then
    uninstall
else
    echo "Invalid choice. Exiting."
fi
