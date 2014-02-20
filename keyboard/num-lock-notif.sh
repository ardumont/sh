#!/bin/bash
# Use: $0
# Send a notification when NUM LOCK on

# verify if the CAPS is on
[ $(led-activated-p.sh) == "2" ] && notif-boom.sh
