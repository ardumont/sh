#!/bin/bash -xe
# Use: $0
# Install nodejs from source

DDIR=$HOME/applications
VERSION=v0.10.26
APP=node-$VERSION
URL=http://nodejs.org/dist/$VERSION/$APP.tar.gz
FILE=node-$VERSION
ARCHIVE=$FILE.tgz
ARCHIVE_PATH=$HOME/Downloads/$ARCHIVE

install.sh g++

mkdir -p $DDIR

# Download the archive once
[ ! -f $ARCHIVE_PATH ] && wget $URL -O $ARCHIVE_PATH

# Install
if [ ! -d $DDIR/$VERSION ]; then
    tar xvf $ARCHIVE_PATH -C $DDIR

    cd $DDIR/$FILE

    ~/bin/deploy/install-from-source.sh
fi

install.sh npm
