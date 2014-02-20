#!/bin/bash

# Send a notification when CAPS LOCK on
icon=$HOME/bin/keyboard/kabooom.jpeg

# verify if the CAPS is on
value=$(xset q | grep "LED mask" | sed -r "s/.*LED mask:\s+[0-9a-fA-F]+([0-9a-fA-F]).*/\1/")
[ "$value" == "0" ] || notify-send -i $icon "CapsLock ON - BOOOOM" -t 1000
