#!/bin/bash -x

SRC=$HOME/repo/perso
REPO_TEAM=$SRC/common-sh
REPO_DOTFILES=$SRC/dot-files

mkdir -p $SRC

[ ! -d $REPO_DOTFILES ] && git clone git@github.com/ardumont/dot-files.git $SRC

# $HOME/bin
rm $HOME/bin
ln -s $SRC/sh $HOME/bin

# $HOME/org
rm $HOME/org
ln -s $SRC/my-org-files $HOME/org

rm $HOME/lecture
ln -s $HOME/Dropbox/Documents/lecture $HOME/lecture

# Deploy the home folder's links
$REPO_DOTFILES/deploy.sh

# create the usefull arborescence
mkdir -p ~/team/
mkdir -p ~/work/
