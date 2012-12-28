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
    xinput --enable $TOUCHPAD_ID
else
    # Deactivate
    xinput --disable $TOUCHPAD_ID
fi
