#!/usr/bin/env bash

WDIR=$(readlink -f $(dirname $0))

REPO=${1:-$HOME/repo/}

cd $REPO
find -name 'project.clj' -exec $WDIR/lein-sync-repo.sh {} \;
