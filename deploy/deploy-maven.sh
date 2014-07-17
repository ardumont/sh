#!/usr/bin/env bash

DDIR=$HOME/Downloads
URL=http://mirrors.ircam.fr/pub/apache/maven/maven-3/3.1.0/binaries/apache-maven-3.1.0-bin.tar.gz
FILENAME=apache-maven-3.1.0
FILE=$DDIR/$FILENAME-bin.tar.gz
IDIR=$HOME/applications/
IFINAL_DIR=$IDIR/$FILENAME
LINKNAME=apache-maven

[ ! -f $FILE ] && wget -O $FILE $URL

[ ! -d $IFINAL_DIR ] && tar xvf $FILE -C $IDIR && cd $IDIR && ln -nsf $IFINAL_DIR $LINKNAME
