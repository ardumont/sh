#!/usr/bin/env bash

REPO=$1
USER=${2-ardumont}

REMOTE_REPO=git@bitbucket.org:$USER/$REPO.git

([ ! -d $REPO ] && echo "Cloning $REMOTE_REPO into $REPO" && git clone $REMOTE_REPO) || echo "Repo $REPO already cloned, nothing to do."
