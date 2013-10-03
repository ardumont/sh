#!/bin/bash -xe

URL=http://dist.groovy.codehaus.org/distributions/groovy-sdk-2.1.7.zip
DDIR=$HOME/Downloads
FILENAME=groovy-sdk-2.1.7
FILE=$DDIR/$FILENAME.zip
IDIR=$HOME/applications/
IFINAL_DIR=$IDIR/$FILENAME
LINKNAME=groovy

[ ! -f $FILE ] && wget -O $FILE $URL

[ ! -d $IFINAL_DIR ] && unzip $FILE -d $IDIR && cd $IDIR && ln -nsf $IFINAL_DIR $LINKNAME
