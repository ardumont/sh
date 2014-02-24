#!/bin/bash
# ------------------------------------------------------------------------------
# Replace:
#     - capslock by ctrl
#     - altgr    by alt
#
# Test before changing the mapping
# To have an alt on the right and an easier ctrl on the left.
# For a much better Emacs experience.
# ------------------------------------------------------------------------------

## function

log() {
    echo "display '$DISPLAY' - $1"
}

## Checks

[ -z "$DISPLAY" ] && log "No display so no keyboard mapping." && return 1

## Run

WDIR=$(dirname $0)

# will be *Caps_Lock* if no customisation or empty otherwise
CAPS=$(xmodmap -display $DISPLAY | grep lock | awk '{print $2}')

if [ "$CAPS" = "Caps_Lock" ]; then
    log "xmodmap customisation..."
    $WDIR/map-keyboard.sh
else
    log "xmodmap already customized!";
fi
