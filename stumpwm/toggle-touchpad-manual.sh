#!/bin/bash -e

# Use: $0 <ID> <STATUS>
# By default the touchpad is activated!
# $0 <ID> 1: To activate the touchpad with id <ID>
# $0 <ID> 0: To deactivate the touchpad with id <ID>

TOUCHPAD_ID=$1
TOUCHPAD_STATUS=${2-:"1"}

if [ $TOUCHPAD_STATUS = "1" ]; then
    # Activate
    xinput --enable $TOUCHPAD_ID
else
    # Deactivate
    xinput --disable $TOUCHPAD_ID
fi
