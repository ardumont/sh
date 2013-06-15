#!/bin/bash

# ------------------------------------------------------------------------------
# Replace :
#     - capslock by ctrl
#     - altgr    by alt
#
# Test before changing the mapping
# To have an alt on the right and an easier ctrl on the left.
# For a much better Emacs experience.
# ------------------------------------------------------------------------------

if [[ $(xmodmap) == *ISO_Level3_Shift* ]]
then
    echo "xmodmap not customized !";
    map-altgr-capslock.sh
else
    echo "xmodmap already customized !";
fi
