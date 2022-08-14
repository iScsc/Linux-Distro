#!/bin/sh

# Color definition
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

base_packages () {
    echo -e "Installing basic packages - ${BLUE}See `pkglist.txt` for more informations${NC}"
    pacman -Qqen > pkglist.txt
    pacman -Sq - > pkglist.txt
    echo -e "${RED}Done !${NC}"
}

aur_helper () {
    echo -e "Installing `paru` ${BLUE}-> /tmp/paru${NC}"
    mkdir /tmp/paru
    echo -e "${RED}Cloning Git repository ...${NC}"
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    echo -e "${RED}Building paru ...${NC}"
    cd /tmp/paru
    makepkg -si
    echo -e "${RED}Done !${NC}"
}

base_packages
aur_helper