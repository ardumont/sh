#!/bin/bash

function log() {
    echo "display '$DISPLAY' - $1"
}

# ------------------------------------------------------------------------------
# Replace :
#     - capslock by ctrl
#     - altgr    by alt
#
# To have an alt on the right and an easier ctrl on the left.
# For a much better Emacs experience.
# ------------------------------------------------------------------------------

XMODMAP="xmodmap -display $DISPLAY -e"

# work around pb in xephyr
$XMODMAP 'keysym Super_L = Num_Lock'

log "Replacing capsLocks by control...";
$XMODMAP 'remove lock      = Caps_Lock'
$XMODMAP 'keysym Caps_Lock = Control_L'
$XMODMAP 'add control      = Control_L'

log "Replacing altgr by leftAlt...";
$XMODMAP 'clear mod5'
$XMODMAP 'add mod1                = Mode_switch'
$XMODMAP "keysym ISO_Level3_Shift = Alt_L"
