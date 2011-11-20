#!/bin/bash

git config --global user.name "Antoine R. Dumont"
git config --global user.email "antoine.romain.dumont@gmail.com"

# emacs
git config --global core.editor "emacsclient -t -nw"
# color everywhere
git config --global color.ui true

# tool to help the merging
git config --global merge.tool ediff

# aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

# unstage a file
git config --global alias.unstage 'reset HEAD --'

# see the last log
git config --global alias.last 'log -1 HEAD'
