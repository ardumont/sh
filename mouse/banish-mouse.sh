#!/usr/bin/env bash

# Use: Banish the mouse to the bottom right corner of the screen

DIMENSION=$(xdpyinfo | grep "dimensions:" | awk '{print $2}')
WIDTH=$(echo $DIMENSION | cut -d'x' -f1)
HEIGHT=$(echo $DIMENSION | cut -d'x' -f2)

xdotool mousemove $WIDTH $HEIGHT
