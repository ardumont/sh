#!/usr/bin/env bash

[ $# -ne 1 -a $# -ne 2 ] && echo "Use: $0 <REPO-NAME> (<REPO-USER>)
REPO-NAME the name of the github repository
REPO-USER the name of the github user (optional and by default 'ardumont')" && exit 1

REPO=$1
USER=${2-ardumont}

REMOTE_REPO=git@github.com:$USER/$REPO.git

([ ! -d $REPO ] && echo "Cloning $REMOTE_REPO into $REPO" && git clone $REMOTE_REPO) || echo "Repo $REPO already cloned, nothing to do."
