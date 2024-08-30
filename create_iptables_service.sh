#!/bin/bash


user="$(echo "$(getent passwd 0)" | cut -d ':' -f 1)"

unit_file='/etc/systemd/system/iptables_script.service'

touch "$unit_file"
chmod 600 "$unit_file"

IFS=$'\n'
unit_strings=(
              "[Unit]" 
              "Description=iptables_rules_script" 
              "[Service]" 
              "Type=oneshot" 
              "ExecStart=/$user/arch_server/iptables_start.sh" 
              "RemainAfterExit=yes" 
              "[Install]" 
              "WantedBy=multi-user.target"
              )

for i in ${unit_strings[@]} ; do
    echo "$i" >> "$unit_file"
done

systemctl daemon-reload
systemctl enable iptables_script
systemctl start iptables_script
