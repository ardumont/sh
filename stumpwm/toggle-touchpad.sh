#!/bin/bash -e

# Use: $0
# By default the touchpad is activated!
# $0 on: To activate the touchpad
# $0 off: To deactivate the touchpad

ACTION=${1-:"on"}

# Find the identifier of the touchpad
TOUCHPAD_ID=$(xinput list | grep -i touchpad | grep -o "id=[0-9]*" | cut -f 2 -d'=')

if [ $ACTION = "on" ]; then
    # Activate
    xinput set-prop $TOUCHPAD_ID "Device Enabled" 1
else
    # Deactivate
    xinput set-prop $TOUCHPAD_ID "Device Enabled" 0
fi
