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

WDIR=$(dirname $0)

log() {
    echo "display '$DISPLAY' - $1"
}

# will be *Caps_Lock* if no customisation or empty otherwise
CAPS=$(xmodmap -display $DISPLAY | grep lock | awk '{print $2}')

if [ "$CAPS" = "Caps_Lock" ]; then
    log "xmodmap customisation..."
    $WDIR/map-altgr-capslock.sh
else
    log "xmodmap already customized!";
fi
