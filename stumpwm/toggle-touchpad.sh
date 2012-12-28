#!/bin/bash -e

# Use: $0
# Toggle automatically on/off the touchpad depending its state

WDIR=$(readlink -f $(dirname $0))

# Find the identifier of the touchpad
TOUCHPAD_ID=$(xinput list | grep -i touchpad | grep -o "id=[0-9]*" | cut -f 2 -d'=')
TOUCHPAD_STATUS=$(xinput --list-props 12 | grep "Device Enabled " | cut -d':' -f 2)

[ $TOUCHPAD_STATUS = "0" ] && NEW_STATUS="1" || NEW_STATUS="0"

$WDIR/toggle-touchpad-manual.sh $NEW_STATUS
