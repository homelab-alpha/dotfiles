#!/bin/bash

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
    for file in ~/.bash_* ~/.bashrc ~/.gitconfig ~/.profile ~/.selected_editor ~/.tmux.conf ~/.zshrc; do
        if [ -e "$file" ]; then
            cp "$file" "$backup_dir" || {
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
install_dotfiles() {
    if cp "$HOME/dotfiles/.bash_exports" "$HOME" &&
        cp "$HOME/dotfiles/.bash_snippets" "$HOME" &&
        cp "$HOME/dotfiles/.bashrc" "$HOME" &&
        cp "$HOME/dotfiles/.gitconfig" "$HOME" &&
        cp "$HOME/dotfiles/.selected_editor" "$HOME" &&
        cp "$HOME/dotfiles/.tmux.conf" "$HOME" &&
        cp "$HOME/dotfiles/.zshrc" "$HOME"; then
        echo "dotfiles successfully installed"
    else
        echo "Error: Unable to install dotfiles" >&2
        exit 1
    fi
}

# Function to backup files before uninstallation
backup_files() {
    local backup_dir="$HOME/dotfiles_backup/before_uninstallation"
    mkdir -p "$backup_dir"

    # Loop through each file and check if it exists before copying
    for file in ~/.bash_* ~/.bashrc ~/.gitconfig ~/.profile ~/.selected_editor ~/.tmux.conf ~/.zshrc; do
        if [ -e "$file" ]; then
            cp "$file" "$backup_dir" || {
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
    rm -f ~/.bash_* ~/.bashrc ~/.gitconfig ~/.profile ~/.selected_editor ~/.tmux.conf ~/.zshrc ||
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
