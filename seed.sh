#!/bin/sh

command_exists() {
    command -v "$1" > /dev/null 2>&1
}

update_system() {
    sudo apt-get update
    sudo apt-get upgrade
}

install_requirements() {
    sudo apt-get install -qq stow curl
}

install_requirements
for module in "./modules/"*.sh; do
    if [ -f "$module" ]; then
        . "$module"
        install
        configure
    fi
done
