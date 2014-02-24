#!/bin/bash -e
# Use: $0
# Install stumpwm from git source

PACKAGE=stumpwm

## Checks

[ $(package-installed.sh $PACKAGE) = "INSTALLED" ] && echo "Package $PACKAGE already installed!" && exit 0

REPO=$HOME/repo/perso/$PACKAGE

[ ! -d $REPO ] && git clone git@github.com:ardumont/stumpwm.git $REPO

cd $REPO

autoconf

./configure

make

sudo checkinstall
