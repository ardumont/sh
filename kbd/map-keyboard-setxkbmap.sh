#!/usr/bin/env bash
# Use: $0
# Result: caps-lock is control, altgr is alt

# file: /usr/share/X11/xkb/rules/

setxkbmap \
    -model "pc105" \
    -layout "us" \
    -option eurosign:e \
    -option ctrl:nocaps \
    -option terminate:ctrl_alt_backspace \
    -option altwin:meta_alt
