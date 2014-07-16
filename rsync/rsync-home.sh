#!/usr/bin/env bash

rsync \
    -avz \
    -e "ssh -l root" \
    --stats \
    --delete \
    --progress \
    --exclude=".cache"
    --exclude="livework"
    --exclude=".gnupg"
    --exclude=".ssh"
    $SRC $DEST
