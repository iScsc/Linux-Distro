#!/bin/sh

# Run this script as sudo -> 'sudo bash dev_install.sh'
pacman -Syu # Check if package database is up to date.

# basic packages
pacman -S man-db man-pages # man pages
pacman -S base-devel # equivalent to 'build-essential' with apt

# SCM
pacman -S git svn github-cli

# DEV
pacman -S python3 python-pip # Python
pacman -S valgrind # C
pacman -S jre-openjdk jdk-openjdk # Java

# AUR Helper
mkdir /tmp/paru
git clone https://aur.archlinux.org/paru.git /tmp/paru
cd /tmp/paru
makepkg -si

# Code editors -> vim is already installed
paru -S visual-studio-code-bin # VSCode
# VSCode extension - dev
code --install-extension --force ms-python.python # Microsoft Python extension pack
code --install-extension --force ms-vscode.cpptools-extension-pack # Microsoft C extension pack
code --install-extension --force formulahendry.code-runner # Code Runner
code --install-extension --force vscjava.vscode-java-pack # Microsoft Java extension pack
# VSCode extension - SCM
code --install-extension --force johnstoncode.svn-scm # SVN support
code --install-extension --force eamodio.gitlens # GitLens extension
code --install-extension --force github.vscode-pull-request-github # Github Pull Request & Issues extension
code --install-extension --force mhutchie.git-graph # Git Graph extension
code --install-extension --force codezombiech.gitignore # gitignore extension


