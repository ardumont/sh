#!/usr/bin/env bash
# Use: $0
# Install stumpwm from source

PACKAGE=stumpwm

## Checks

[ $(package-installed.sh $PACKAGE) = "INSTALLED" ] && echo "Package $PACKAGE already installed!" && exit 0

## Function definition

function unarchive() {
    ARCHIVE=$1
    DDIR=$2
    tar xvf $ARCHIVE -C $DDIR
}

## Run

FILE=0.9.8
FILE_AR=$FILE.tar.gz
DDIR_AR_FILE=$HOME/Downloads/$FILE_AR
IDIR=$HOME/applications

[ ! -f $DDIR_AR_FILE ] && wget https://github.com/stumpwm/stumpwm/archive/$FILE_AR -O $DDIR_AR_FILE

unarchive $DDIR_AR_FILE $IDIR

cd $IDIR/$PACKAGE-$FILE

autoconf

./configure

make

sudo checkinstall

ln -s $IDIR/$PACKAGE-$FILE $IDIR/$PACKAGE
