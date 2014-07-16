#!/usr/bin/env bash -xe

URL=http://mirror.ovh.net/ftp.ovh.net/MoM/MoM-4.1.15.tar.gz
DDIR=$HOME/Downloads
FILENAME=MoM-4.1.15
FILE=$DDIR/$FILENAME.tar.gz
IDIR=$HOME/applications/
IFINAL_DIR=$IDIR/$FILENAME
LINKNAME=mom

[ ! -f $FILE ] && wget -O $FILE $URL

[ ! -d $IFINAL_DIR ] && tar xvf $FILE -C $IDIR && cd $IDIR && ln -nsf $IFINAL_DIR $LINKNAME
