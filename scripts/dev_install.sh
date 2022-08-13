#!/bin/sh

# Run this script as sudo -> 'sudo bash dev_install.sh'
pacman -Syu # Check if package database is up to date.

pacman -S man-db man-pages # man pages
pacman -S base-devel



