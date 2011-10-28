#!/bin/bash

# function to log the action
do-action() {
    echo -e "\n$1"
    $1
}

# To destroy a link
function destroy-link() {
    [ -h $1 -o -f $1 ] && rm $1
}

# To destroy a link or backup a directory (use: emacs)
function destroy-link-or-backup-file() {
    if [ -h $1 ]; then
	rm $1
    else
	mv $1. "$1.clean-install"
    fi
}

# deploy git repository or just update it if it already exists
function deploy-git-clone-or-update() {
    REPO=$1
    DEST=$2
    [ ! -d $DEST ] && do-action "git clone $REPO $DEST" || do-action "cd $DEST && git reset --hard HEAD && git pull"
}
