#!/usr/bin/env bash

WDIR=$(readlink -f $(dirname $0))

REPO=${1:-$HOME/repo/}

cd $REPO
find -name 'pom.xml' -exec $WDIR/mvn-sync-repo.sh {} \;
