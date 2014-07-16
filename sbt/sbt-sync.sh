#!/usr/bin/env bash -xe

WDIR=$(readlink -f $(dirname $0))

REPO=${1:-$HOME/repo/}

cd $REPO
find -name 'build.sbt' -exec $WDIR/sbt-sync-repo.sh {} \;
