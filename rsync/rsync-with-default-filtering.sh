#!/usr/bin/env bash

[ $# -ne 2 ] && echo "Use: $0 <SRC> <DEST>" && exit 1

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
    --exclude ".nix-channel" \
    --exclude ".nix-defexpr" \
    $SRC $DEST
