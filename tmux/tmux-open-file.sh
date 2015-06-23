#!/bin/sh
# tmux-open-file - open last file URL in current tmux pane in emacsclient

LAST_URL=$(tmux capture-pane -p \; show-buffer -b0 \; delete-buffer -b0 | \

                  grep -P -o '(file://|/)[a-zA-Z0-9\-\@;\/?:&=%\$_.+!*\x27,~#]*(\([a-zA-Z0-9\-\@;\/?:&=%\$_.+!*\x27,~#]*\)|[a-zA-Z0-9\-\@;\/?:&=%\$_+*~])+' | tail -1)

#echo $LAST_URL
emacsclient -nw "$LAST_URL"
