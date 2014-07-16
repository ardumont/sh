#!bash -xe

DDIR=$HOME/Downloads
URL=https://java.net/projects/visualvm/downloads/download/release136/visualvm_136.zip
FILENAME=visualvm_136
FILE=$DDIR/$FILENAME.zip
IDIR=$HOME/applications
IFINAL_DIR=$IDIR/$FILENAME
LINKNAME=visualvm

[ ! -f $FILE ] && wget -O $FILE $URL

[ ! -d $IFINAL_DIR ] && unzip $FILE -d $IDIR && cd $IDIR && ln -nsf $IFINAL_DIR $LINKNAME
