#!/bin/bash


get_yay() {
    cd
    mkdir AUR
    cd AUR
    git clone https://aur.archlinux.org/yay.git 
    cd yay
    makepkg -si
    exit 0
}

get_ssserver() {
    yay -S shadowsocks-rust
    exit 0
}

get_get() {
    get_yay
    get_ssserver
}

get_get
