#!bash
# Use: $0
# Result: caps-lock is control, altgr is alt

# file: /usr/share/X11/xkb/rules/

setxkbmap \
    -model "pc105" \
    -layout "us" \
    -option \
    -option ctrl:nocaps \
    -option terminate:ctrl_alt_bkspc \
    -option altwin:meta_alt
