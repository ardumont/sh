#!/usr/bin/env bash

# count the number of type (tree, blob, tag, commit)
REPO=${1-`pwd`}
TYPE=${2-"commit"}

cd $REPO
NUM=$(git rev-list --objects --all \
             | git cat-file --batch-check='%(objectname) %(objecttype) %(rest)' \
             | cut -f2 -d' ' \
             | grep $TYPE \
             | wc -l)
echo "$REPO $TYPE $NUM"
