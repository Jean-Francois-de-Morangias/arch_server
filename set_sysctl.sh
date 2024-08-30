#!/bin/bash

set_sysctl() {
    cp /root/arch_server/sysctl.conf /etc/
    chmod 644 sysctl.conf
    exit 0
}

set_sysctl
