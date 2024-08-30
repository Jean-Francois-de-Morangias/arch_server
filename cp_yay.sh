#!/bin/bash


cp_yay() {
    cp ./get_yay.sh /home/0xm00nc0d3
    chown -R 0xm00nc0de:0xm00nc0d3 get_yay.sh
    chmod 700 get_yay.sh
    exit 0
}

cp_yay
