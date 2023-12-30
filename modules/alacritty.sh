#!/bin/sh

install() {
    (
        # Install requirements
        sudo apt-get install -qq cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 gzip scdoc
        curl https://sh.rustup.rs -sSf | sh -s -- -y

        # Build alacritty
        rm -rf /tmp/alacritty
        git clone https://github.com/alacritty/alacritty.git /tmp/alacritty
        cd /tmp/alacritty
        $HOME/.cargo/bin/cargo build --release
        
        # Install terminfo
        sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
        
        # Create icons
        sudo cp target/release/alacritty /usr/local/bin
        sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
        sudo desktop-file-install extra/linux/Alacritty.desktop
        sudo update-desktop-database

        # Create manual
        sudo mkdir -p /usr/local/share/man/man1
        sudo mkdir -p /usr/local/share/man/man5
        scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
        scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
        scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
        scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null

        # Add completions
        ALACRITTY_PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins/_alacritty"
        mkdir -p "$ALACRITTY_PLUGIN_DIR"
        cp "extra/completions/_alacritty" "$ALACRITTY_PLUGIN_DIR/_alacritty.plugin.zsh"
    )
}

configure(){ :; }
