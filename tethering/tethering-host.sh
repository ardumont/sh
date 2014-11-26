#!/usr/bin/env bash

HOST_IP=10.42.0.1
CONN=enp0s20u

sudo ifconfig $CONN $HOST_IP netmask 255.255.255.0

sudo iptables -t nat -F

sudo iptables -t nat -A POSTROUTING -j MASQUERADE
