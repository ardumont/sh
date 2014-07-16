#!bash -xe

DDIR=$HOME/Downloads
URL=http://www.scala-lang.org/files/archive/scala-2.10.4.tgz
FILENAME=scala-2.10.4
FILE=$DDIR/$FILENAME.tgz
IDIR=$HOME/applications/
IFINAL_DIR=$IDIR/$FILENAME
LINKNAME=scala

[ ! -f $FILE ] && wget -O $FILE $URL

[ ! -d $IFINAL_DIR ] && tar xvf $FILE -C $IDIR && cd $IDIR && ln -nsf $IFINAL_DIR $LINKNAME
