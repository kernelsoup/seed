#!/bin/sh

install() {
    sudo snap install code --classic
    code --install-extension ms-python.python
    code --install-extension ms-python.vscode-pylance
    code --install-extension ms-toolsai.jupyter
    code --install-extension ms-toolsai.jupyter-keymap
    code --install-extension ms-toolsai.jupyter-renderers
    code --install-extension ms-toolsai.vscode-jupyter-cell-tags
    code --install-extension ms-toolsai.vscode-jupyter-slideshow
    code --install-extension streetsidesoftware.code-spell-checker
    code --install-extension stkb.rewrap
}

configure(){ :; }
