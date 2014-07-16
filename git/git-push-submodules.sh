#!/usr/bin/env bash
# Use: $0
# Make the submodule push their current HEAD to the remote branch

WDIR=$1
BRANCH=master
ROOT_DIR=$(pwd)

for d in *; do
    [ -d $d ] && cd $d && echo "module: $d" && git checkout $BRANCH && git push origin $BRANCH
    cd $ROOT_DIR
done
