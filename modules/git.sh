#!/bin/sh

install() {
    sudo apt-get install -qq git
}

configure() {
    (
        cd "$(pwd)/configurations"
        stow -t "$HOME" git
    )
}
