# Dotfiles

<p align="right">
 <a href="https://github.com/homelab-alpha/dotfiles/actions/workflows/super-linter.yml">
  <img
   src="https://github.com/homelab-alpha/dotfiles/actions/workflows/super-linter.yml/badge.svg?branch=main"
   alt="Super-Linter"
  />
 </a>
</p>

Welcome to my dotfiles repository!

## Overview

Dotfiles are configuration files used to personalize your system environment. This repository contains my customized settings and configurations for various command-line tools, editors, and applications that I use regularly.

## Contents

- **bash**: Configuration files for the Bash shell.

- **vim**: Settings and plugins for the Vim text editor.

- **git**: Git configuration settings.

- **tmux**: Configuration for the tmux terminal multiplexer.

- **scripts**: Useful scripts for automating tasks or enhancing productivity.

- **other**: Additional configuration files for miscellaneous applications.

## Usage

Feel free to explore and use any of the configurations provided in this repository. You can clone this repository to your local machine and symlink the desired configuration files to your home directory. Remember to back up your existing configurations before overwriting them.

## Quick install

```bash
git clone https://github.com/homelab-alpha/dotfiles.git && cd dotfiles && echo 1 | ./install.sh
```

## Using the `install.sh` Script to Manage Dotfiles

1. **Clone the Repository:** Run the following command in your terminal:

   ```bash
   git clone https://github.com/homelab-alpha/dotfiles.git
   ```

   This command will clone the dotfiles repository from GitHub to your local machine.

2. **Navigate to the Folder:** Go to the cloned repository by running the following command:

   ```bash
   cd $HOME/dotfiles
   ```

3. **Run the Installation Script:** Once you are in the `dotfiles` folder, run the installation script with:

   ```bash
   ./install.sh
   ```

   This script installs the dotfiles according to the specified configuration.

4. **Follow Any Instructions:** If the script prompts for further actions, follow the displayed instructions.

5. **Before installation:** The following files will be backed up:

   ```bash
   ~/.bash_*
   ~/.bashrc
   ~/.gitconfig
   ~/.profile
   ~/.selected_editor
   ~/.tmux.conf
   ~/.zshrc
   ```

   You can find the backup in `$HOME/dotfiles_backup/before_installation`

6. **Check the Installation:** After completing the installation script, check if your dotfiles are installed correctly as expected.

7. **Removal of Dotfiles:** To remove the dotfiles, run the `install.sh` script again and follow the instructions.

8. **Before uninstall:** Just like before installation, your files will be backed up:

   ```bash
   ~/.bash_*
   ~/.bashrc
   ~/.gitconfig
   ~/.profile
   ~/.selected_editor
   ~/.tmux.conf
   ~/.zshrc
   ```

   These backups are stored in `$HOME/dotfiles_backup/before_uninstallation`

9. **After deletion:** Your dotfiles will be restored from the backup.

10. **Check the Uninstall:** After uninstalling, check if everything has been uninstalled correctly.

By following these steps, you can effectively manage your dotfiles using the `install.sh` script from the GitHub repository. If you have any further questions, feel free to ask!

## Log Files

The location of log files can vary depending on the specific operating system and application being used. Dotfiles, log files are often stored in a subdirectory within the application's installation directory or in a system directory such as `/var/log` on Linux

## Contribution

No external contributions are currently being accepted for this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details.

## Contact

If you have any questions, suggestions, or issues, please feel free to open an [issue].

[issue]: https://github.com/homelab-alpha/dotfiles/issues/new
