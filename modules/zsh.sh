#!/bin/sh

install() {
    sudo apt-get install -qq zsh
    if ! [ -d "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
    mv "$HOME/.zshrc" "$HOME/.zshrc_backup"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
    git clone https://github.com/jeffreytse/zsh-vi-mode  "$HOME/.oh-my-zsh/custom/plugins/zsh-vi-mode"
    git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
}

configure() {
    (
        cd "$(pwd)/configurations"
        stow -t "$HOME" zsh
    )
}
