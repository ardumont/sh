#!/bin/bash -e

SRC=$HOME/repo/perso
REPO_TEAM=$SRC/common-sh

# create the usefull arborescence
mkdir -p ~/{team, work, $SRC}

# personal scripts
ln -nsf $SRC/sh $HOME/bin

# personal org files
ln -nsf $SRC/my-org-files $HOME/org

# personal books
ln -nsf $HOME/Dropbox/Documents/books $HOME/books