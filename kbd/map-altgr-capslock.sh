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

log "Replacing capsLocks by control...";
xmodmap -display $DISPLAY -e 'remove lock = Caps_Lock'
xmodmap -display $DISPLAY -e 'keysym Caps_Lock = Control_L'
xmodmap -display $DISPLAY -e 'add control = Control_L'

log "Replacing altgr by leftAlt...";
xmodmap -display $DISPLAY -e 'clear mod5'
xmodmap -display $DISPLAY -e 'add mod1 = Mode_switch'
xmodmap -display $DISPLAY -e "keysym ISO_Level3_Shift = Alt_L"
