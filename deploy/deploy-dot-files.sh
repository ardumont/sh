#!/usr/bin/env bash

# Use: This script deploy emacs-live and emacs-live-packs from my git repositories

HREPO=$HOME/repo/perso

# First clone the repositories
[ ! -d $HREPO/dot-files ] && git clone git@github.com:ardumont/dot-files.git $HREPO/dot-files

# deploy
$HREPO/dot-files/deploy.sh
