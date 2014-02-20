#!/bin/bash
# Use: $0
# Send a notification when NUM LOCK on

# verify if the CAPS is on
value=$(xset q | grep "Num Lock" | awk '{print $8}')
[ "$value" == "on" ] && notif-boom.sh
