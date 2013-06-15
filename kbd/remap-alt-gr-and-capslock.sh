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

if [[ $(xmodmap -display $DISPLAY) == *ISO_Level3_Shift* ]]
then
    log "xmodmap customisation..."
    map-altgr-capslock.sh
else
    log "xmodmap already customized !";
fi
