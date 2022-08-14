#!/bin/sh

# Code editors -> vim is already installed
install_code () {
    paru -S visual-studio-code-bin # VSCode
}

# VSCode extension
extension_file='extlists.txt'
install_extension () {
    while read p; do
        code --install_extension --force "$p"
    done < "$extension_file"
}

install_extension