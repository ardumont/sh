#!/usr/bin/env bash

URL=http://services.gradle.org/distributions/gradle-1.8-all.zip
DDIR=$HOME/Downloads
FILENAME=gradle-1.8-all
FILE=$DDIR/$FILENAME.zip
IDIR=$HOME/applications/
IFINAL_DIR=$IDIR/$FILENAME
LINKNAME=gradle

[ ! -f $FILE ] && wget -O $FILE $URL

[ ! -d $IFINAL_DIR ] && unzip $FILE -d $IDIR && cd $IDIR && ln -nsf $IFINAL_DIR $LINKNAME
