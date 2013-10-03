#!/bin/bash -xe

FILE=$HOME/Downloads/node.tgz
DDIR=$HOME/applications

mkdir -p $DDIR

[ ! -f $FILE ] && wget http://nodejs.org/dist/v0.10.20/node-v0.10.20.tar.gz -O $FILE

if [ ! -d $DDIR/node-v0.10.20 ]; then
    tar xvf $FILE -C $DDIR

    cd $DDIR/node-v0.10.20

    ./configure
    make
    sudo make install
fi
