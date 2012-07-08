#!/bin/bash

REPO=~/repositories/perso/emacs-live

[ ! -f $REPO ] && git clone git@github.com:ardumont/emacs-live.git $REPO

ln -s $REPO ~/.emacs.d
cd ~/.emacs.d

git checkout tony

