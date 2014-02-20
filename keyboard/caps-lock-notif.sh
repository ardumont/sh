#!/bin/bash
# Use: $0
# Send a notification when CAPS LOCK on

# verify if the CAPS is on
value=$(xset q | grep "LED mask" | sed -r "s/.*LED mask:\s+[0-9a-fA-F]+([0-9a-fA-F]).*/\1/")
[ "$value" == "0" ] || notif-boom.sh
