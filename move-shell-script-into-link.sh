#!/bin/bash

DEST_DIR=~/bin
SRC_DIR=/home/tony/Dropbox/repositories/git/slash-my-home-slash-bin

for i in $(ls $SRC_DIR *.sh); 
do
    echo "rm $DEST_DIR/$i"
    rm $DEST_DIR/$i

    echo "ln -s $SRC_DIR/$i $DEST_DIR/$i"
    ln -s $SRC_DIR/$i $DEST_DIR/$i;
done
