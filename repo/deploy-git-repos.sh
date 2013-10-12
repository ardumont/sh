#!/bin/bash -xe

[ -z $WDIR ] && WDIR=$HOME/repo/perso
[ ! -d $WDIR ] && mkdir -p $WDIR

cd $WDIR

for giturl in $(cat ~/bin/repo/git-repos.list); do
    git clone $giturl $WDIR/
done
