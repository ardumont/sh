#!bash

# Filter files
#FILTER=*.sh
FILTER=.*

# Directory structure
DEST_DIR=~
SRC_DIR=/home/tony/Dropbox/repositories/git/sh

for i in $(ls $SRC_DIR $FILTER);
do
    echo "rm $DEST_DIR/$i"
    rm $DEST_DIR/$i

    echo "ln -s $SRC_DIR/$i $DEST_DIR/$i"
    ln -s $SRC_DIR/$i $DEST_DIR/$i;
done
