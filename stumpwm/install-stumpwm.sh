#!/bin/bash -e
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

[ ! -f $DDIR_AR_FILE ] && wget https://github.com/sabetts/stumpwm/archive/$FILE_AR -O $DDIR_AR_FILE

unarchive $DDIR_AR_FILE /tmp/

cd /tmp/$PACKAGE-$FILE

autoconf

./configure

make

sudo checkinstall
