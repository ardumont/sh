#!/usr/bin/env bash -xe

XDP=:20
DP=$XDP.0

HOSTNAME=$(hostname)

# resolution depending on my hostname
[ $HOSTNAME = "FR-WS-307" -o $HOSTNAME = "dagobah" -o $HOSTNAME = "myrkr" ] && RES="1920x1080" || RES="1366x768"

# Launch a xephyr xserver
# -ac disable access control
# -br create root window with black background
# -noreset don't reset after last client exists
# -screen XxY specify screen characteristics
Xephyr -ac -br -noreset -screen $RES $XDP &

# wait a little
sleep 1

xterm -display $DP
