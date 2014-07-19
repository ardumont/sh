#!/usr/bin/env bash

SRC=$1
DEST=$2

rsync \
    -avz \
    -e ssh \
    --stats \
    --progress \
    --delete \
    --exclude ".*-old" \
    --exclude ".*-obsolete" \
    --exclude ".cache" \
    --exclude "livework" \
    $SRC $DEST
