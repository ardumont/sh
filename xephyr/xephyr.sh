#!/bin/bash -xe

XDP=:1
DP=$XDP.0

MANAGER=$1
HOSTNAME=$(hostname)

# resolution depending on my hostname
[ $HOSTNAME = "FR-WS-307" -o $HOSTNAME = "dagobah" -o $HOSTNAME = "myrkr" ] && RES="1920x1080" || RES="1366x768"

# Launch a xephyr xserver
# -ac disable access control
# -br create root window with black background
# -noreset don't reset after last client exists
# -screen XxY specify screen characteristics
Xephyr -ac -br -noreset -screen $RES $XDP &

# wait a little for xephyr to start (FIXME: improve on this)
sleep 1

# Then launch a connection
DISPLAY=$DP

if [ "$MANAGER" = "gnome" ];
then
    metacity --display $DP &
    gnome-panel --replace &
elif [ "$MANAGER" = "xmonad" ]
then
    xmonad &
fi

xterm -display $DP

# ssh -XfC -c blowfish tony@localhost some-apps
