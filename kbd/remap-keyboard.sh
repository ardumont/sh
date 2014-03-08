#!/bin/bash
# Use: $0
# If no display variable set, log a simple message and exit
# Otherwise, launch the keyboard mapping.
#
# Test before changing the mapping
# For a much better Emacs/Stumpwm/Firefox with keysnail experience.
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
    $WDIR/map-keyboard-xmodmap.sh
    # $WDIR/map-keyboard-setxkbmap.sh
else
    log "xmodmap already customized!";
fi
