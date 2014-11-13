#!/usr/bin/env zsh

DEST_FILE="$HOME/bin/git/git-remote-hg"

wget https://raw.github.com/felipec/git/master/git-remote-hg.py -O $DEST_FILE

chmod +x $DEST_FILE
