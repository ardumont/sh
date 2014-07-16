#!/usr/bin/env bash -xe

# Use:
# $0

if [ $# -ne 0 ]; then
    echo<<EOF
Use: $0
This will trigger the installation of the ensime server - http://aemoncannon.github.io/ensime/index.html
EOF
    exit 1;
fi

# static setup

FILENAME=ensime_2.10.0-0.9.8.9
FILE=$FILENAME.tar.gz
URL="https://dl.dropboxusercontent.com/sh/ryd981hq08swyqr/ZiCwjjr_vm/ENSIME%20Releases/$FILE?token_hash=AAHpPjuDRijzZt1Qhvh6BJnRiaLjPCtPGMzvd-x5VIHcJA&dl=1"
DDIR=$HOME/Downloads/scala
FQN_FILE=$DDIR/$FILE
IDIR=$HOME/applications

# actions

mkdir -p $IDIR
mkdir -p $DDIR

[ ! -f $FQN_FILE ] && wget $URL -O $FQN_FILE

[ ! -d $IDIR/$FILENAME ] && tar xvf $FQN_FILE -C $IDIR

[ ! -f $IDIR/ensime ] && ln -snf $IDIR/$FILENAME $IDIR/ensime
