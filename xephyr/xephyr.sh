#!/bin/bash -xe

XDP=:1
DP=$XDP.0

# resolution depending on my hostname
RES="1366x768"

# Launch a xephyr xserver
Xephyr -ac -br -noreset -screen $RES $XDP &

# wait a little
sleep 1

metacity --display $DP &

# Then launch a connection
DISPLAY=$DP gnome-panel --replace &

xterm -display $DP

# ssh -XfC -c blowfish tony@localhost some-apps
