#!/bin/sh

install() {
    sudo apt-get install -qq vim
}

configure() {
    (
        cd "$(pwd)/configurations"
        stow -t "$HOME" vim
    )
}
