#!/bin/bash -e

# Use: $0
# Toggle automatically on/off the touchpad depending its state

# Find the identifier of the touchpad
TOUCHPAD_ID=$(xinput list | grep -i touchpad | grep -o "id=[0-9]*" | cut -f 2 -d'=')
TOUCHPAD_STATUS=$(xinput --list-props 12 | grep "Device Enabled " | cut -d':' -f 2)

echo "TID: $TOUCHPAD_ID ; TST: $TOUCHPAD_STATUS"
echo

if [ $TOUCHPAD_STATUS = "0" ]; then
    # Activate
    xinput --enable $TOUCHPAD_ID
else
    # Deactivate
    xinput --disable $TOUCHPAD_ID
fi
