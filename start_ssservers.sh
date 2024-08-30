#!/bin/bash


config_path="/etc/shadowsocks-rust/"

configs_array=()

for config in "$config_path"* ; do
    if [ -f $config ] ; then
        configs_array+=("$config")
    fi
done

for config in ${configs_array[@]} ; do
    /usr/bin/ssserver -c "$config" &
done

wait
