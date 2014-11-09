#!/usr/bin/env bash

[ $# -ne 1 ] && echo "Use: $0 <REPO-USER>
REPO-USER the name of the github user to add the upstream branch" && exit 1

USER=${1}
REPO=${PWD##*/}

REMOTE_REPO=git@github.com:$USER/$REPO.git
REMOTE_UPSTREAM=upstream

(git config -l | grep upstream && \
 echo "Branch upstream already set! Nothing to do.") || \
(git remote add $REMOTE_UPSTREAM $REMOTE_REPO && \
 echo "Branch $REMOTE_UPSTREAM set to $REMOTE_REPO.")
