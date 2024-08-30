#!/bin/bash

iptables -A INPUT -i lo -j ACCEPT
#iptables -A INPUT -p udp --dport 51830 -m state --state NEW -j ACCEPT
iptables -A INPUT -p tcp -m multiport --dports 8388:8400 -m state --state NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 53642 -m state --state NEW -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -m state --state INVALID -j DROP
iptables -P INPUT DROP
