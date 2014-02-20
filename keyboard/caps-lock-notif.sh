#!/bin/bash
# Use: $0
# Send a notification when CAPS LOCK on

# verify if the CAPS is on
[ "$(led-activated-p.sh)" == "1" ] && notif-boom.sh
