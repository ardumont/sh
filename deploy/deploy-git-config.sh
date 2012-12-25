#!/bin/bash

git config --global user.name "Antoine R. Dumont"
git config --global user.email "antoine.romain.dumont@gmail.com"

# emacs
git config --global core.editor "emacsclient -nw"

# color everywhere (one flag)
git config --global color.ui true
# or in separate
#git config --global color.branch auto
#git config --global color.diff auto
#git config --global color.interactive auto
#git config --global color.status auto

# tool to help the merging
git config --global merge.tool meld

# aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

# unstage a file
git config --global alias.unstage 'reset HEAD~ --'

# see the last log
git config --global alias.last 'log -1 HEAD'
