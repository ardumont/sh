#!/bin/bash

# ------------------------------------------------------------------------------
# Replace :
#     - capslock by ctrl
#     - altgr    by alt
#
# To have an alt on the right and an easier ctrl on the left.
# For a much better Emacs experience.
# ------------------------------------------------------------------------------

echo "Replacing capsLocks by control ....";
xmodmap -e 'remove Lock = Caps_Lock'
xmodmap -e 'keysym Caps_Lock = Control_L'
xmodmap -e 'add Control = Control_L'

echo "Replacing altgr by leftAlt ....";
xmodmap -e 'clear mod5'
xmodmap -e 'add mod1 = Mode_switch'
xmodmap -e "keysym ISO_Level3_Shift = Alt_L"
