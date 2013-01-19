#!/bin/bash -xe

XDP=:1
DP=$XDP.0

# Launch a xephyr xserver
Xephyr -ac -br -noreset -screen 1366x768 $XDP &

# wait a little
sleep 1

metacity --display $DP &

# Then launch a connection
DISPLAY=$DP gnome-panel --replace &

xterm -display $DP

# ssh -XfC -c blowfish tony@localhost some-apps
