#!/bin/bash

# test the argument
if [ -z $1 ];
then
    echo "$0 <link-to-resolve>";
    exit 1;
fi

# test the link
if [ -h $1 ]; then
    FILE=$(basename $1);
    echo "Ok, '$1' is a link, trying to determine the directory parent of '$FILE'.";

    DEST=$(ls -lad $1 | awk '{print $11}' | xargs dirname);
    echo "It seems to be '$DEST', trying to go there.";

    cd $DEST
    echo "done";
else
    echo "Not a link, do nothing.";
fi