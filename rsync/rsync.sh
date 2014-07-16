#!/usr/bin/env bash

[ $# -ne 2 ] && echo "Use: $0 <SRC> <DEST>" && return 1

SRC=$1
DEST=$2

rsync -avz -e ssh $SRC $DEST
