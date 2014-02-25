#!/bin/bash

PACKAGE=org-mode

## Checks

[ $(package-installed.sh $PACKAGE) = "INSTALLED" ] && echo "Package $PACKAGE already installed!" && exit 0

REPO=$HOME/repo/perso/$PACKAGE

[ ! -d $REPO ] && git clone git://orgmode.org/org-mode.git $REPO

cd $REPO

make autoloads
