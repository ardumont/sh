#!/bin/bash

function log() {
    echo "display '$DISPLAY' - $1"
}

# ------------------------------------------------------------------------------
# Replace:
#     - capslock by ctrl
#     - altgr    by alt
#
# Test before changing the mapping
# To have an alt on the right and an easier ctrl on the left.
# For a much better Emacs experience.
# ------------------------------------------------------------------------------

# will be *Caps_Lock* if no customisation or empty otherwise
CAPS=$(xmodmap -display $DISPLAY | grep lock | awk '{print $2}')

if [[ $CAPS == *Caps_Lock* ]]
then
    log "xmodmap customisation..."
    map-altgr-capslock.sh
else
    log "xmodmap already customized !";
fi
