#!/usr/bin/env bash

[ $# -ne 2 ] && echo "Use: $0 <SRC> <DEST>" && exit 1

SRC=$1
DEST=$2

rsync -avuz -e ssh $SRC $DEST
