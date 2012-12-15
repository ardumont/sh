#!/bin/bash -xe

WDIR=$(readlink -f $(dirname $0))

REPO=$1
[ -z $REPO ] && REPO=$HOME/repo/

cd $REPO
find -name '.git' -exec $WDIR/git-sync-repo.sh {} \;
