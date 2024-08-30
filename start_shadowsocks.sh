#!/bin/bash


run_ssserver() {
    cp /root/arch_server/shadowsock-rust.service /etc/systemd/system
    systemctl daemon-reload
    systemctl enable shadowsock-rust
    systemctl start shadowsock-rust
    exit 0
}

run_ssserver
