#!/usr/bin/env bash
# Use: $0
# Send a notification when CAPS LOCK on

# verify if the CAPS is on
value=$(xset q | grep "Caps Lock" | awk '{print $4}')
[ "$value" == "on" ] && notif-boom.sh
