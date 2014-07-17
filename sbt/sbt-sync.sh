#!/usr/bin/env bash

WDIR=$(readlink -f $(dirname $0))

REPO=${1:-$HOME/repo/}

cd $REPO
find -name 'build.sbt' -exec $WDIR/sbt-sync-repo.sh {} \;
