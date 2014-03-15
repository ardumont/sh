#!/bin/bash -xe

DDIR=$HOME/applications
VERSION=v0.10.26
APP=node-$VERSION
URL=http://nodejs.org/dist/$VERSION/$APP.tar.gz
FILE=$HOME/Downloads/node-$VERSION.tgz

install.sh g++

mkdir -p $DDIR

[ ! -f $FILE ] && wget $URL -O $FILE

if [ ! -d $DDIR/$VERSION ]; then
    tar xvf $FILE -C $DDIR

    cd $DDIR/$VERSION

    ./configure
    make
    sudo make install
fi
