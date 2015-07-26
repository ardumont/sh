#!/usr/bin/env bash

set -x
rsync \
    -avz \
    -e ssh \
    --stats \
    --progress \
    --exclude ".*-old" \
    --exclude ".*-obsolete" \
    --exclude ".cache" \
    --exclude ".local" \
    --exclude ".IdeaIC14" \
    --exclude "Downloads" \
    --exclude ".nix-channel" \
    --exclude ".nix-defexpr" \
    --exclude ".nix-profile" \
    --exclude ".sync" \
    $*
