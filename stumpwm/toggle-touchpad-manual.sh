#!/bin/bash -e

# Use: $0 <STATUS>
# By default the touchpad is activated!
# $0 1: To activate the touchpad with id <ID>
# $0 0: To deactivate the touchpad with id <ID>

TOUCHPAD_STATUS=${1-:"1"}

TOUCHPAD_ID=$(xinput list\
                    | grep -i touchpad \
                    | grep -o "id=[0-9]*" \
                    | cut -f 2 -d'=')

if [ $TOUCHPAD_STATUS = "1" ]; then
    # Activate
    xinput --enable $TOUCHPAD_ID
else
    # Deactivate
    xinput --disable $TOUCHPAD_ID
fi
