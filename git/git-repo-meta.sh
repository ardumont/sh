#!/usr/bin/env bash

# count the number of type (tree, blob, tag, commit)
REPO=${1-`pwd`}
TYPE=${2-"all"}

data() {
    git rev-list --objects --all \
             | git cat-file --batch-check='%(objectname) %(objecttype) %(rest)' \
             | cut -f2 -d' ' \
             | grep $1 \
             | wc -l
}

cd $REPO

if [ "$TYPE" = "all" ]; then
    NUM_COM=$(data "commit")
    NUM_TRE=$(data "tree")
    NUM_BLO=$(data "blob")
    NUM_TAG=$(data "tag")
    cat <<EOC
commit $NUM_COM
tree $NUM_TRE
blob $NUM_BLO
tag $NUM_TAG
EOC
else
    NUM=$(data $TYPE)
    echo "$TYPE $NUM"
fi
