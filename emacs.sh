#!/bin/bash

# dark: manoj-dark wheat-grass
# light: whiteboard
THEME=$1
# by default
[ -z $THEME ] && THEME="dark"

DARK=wheatgrass
LIGHT=whiteboard
GREY=wombat

if [ $THEME = "dark" ] ; then
    THEME_EMACS=$DARK
elif [ $THEME = "grey" ] ; then
    THEME_EMACS=$GREY
else
    THEME_EMACS=$LIGHT
fi

echo "emacs --eval '(load-theme '$THEME_EMACS)'"
emacs --eval "(load-theme '$THEME_EMACS)"
