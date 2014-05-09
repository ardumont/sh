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

# activate or deactivate?
[ $TOUCHPAD_STATUS = "1" ] && ACTION="--enable" || ACTION="--disable"

# commit the actions
xinput $ACTION $TOUCHPAD_ID
