#!/usr/bin/env bash

rsync \
    -avz \
    -e ssh \
    --stats \
    --progress \
    --delete \
    --exclude ".*-old" \
    --exclude ".*-obsolete" \
    --exclude ".cache" \
    --exclude ".local" \
    --exclude ".nix-channel" \
    --exclude ".nix-defexpr" \
    $*
