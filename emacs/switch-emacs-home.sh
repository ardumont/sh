#!/usr/bin/env bash

SWITCH=${1-"prelude"}

DEST=~/.emacs.d

[ -L $DEST ] && rm $DEST

if [ $SWITCH = "prelude" ]; then
    ln -nsf ~/repo/perso/prelude $DEST
else
    ln -nsf ~/repo/perso/.emacs.d $DEST
fi
