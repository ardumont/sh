#!/bin/bash

DROPBOX=~/Dropbox

# To destroy a link
function destroy-link() {
    if [ -h $1 ]; then
	rm $1
    fi
}

# To destroy a link or backup a directory (use: emacs)
function destroy-link-or-backup-file() {
    if [ -h $1 ]; then
	rm $1
    else
	mv $1. "$1.clean-install"
    fi
}

# ~/bin
destroy-link ~/bin
ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin ~/bin

# ~/org
destroy-link ~/org
ln -s $DROPBOX/repositories/git/my-org-files ~/org

# ~/.stumpwmrc
destroy-link ~/.stumpwmrc
ln -s $DROPBOX/repositories/git/stumpw-config/.stumpwmrc ~

# ~/.bash*
destroy-link ~/.bashrc
destroy-link ~/.bash_aliases
destroy-link ~/.profile
destroy-link ~/.bash_history

ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin/.bashrc ~/
ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin/.profile ~/
ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin/.bash_aliases ~/
# not synchronized on github
ln -s $DROPBOX/.bash_history ~/

# git-bash-completion
destroy-link ~/.git-completion.bash
ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin/.git-completion.bash ~/

# For emacs
destroy-link-or-backup-file ~/.emacs.d
ln -s ~/Dropbox/Documents/emacs.d ~/.emacs.d

# For conkeror
destroy-link ~/.conkerorrc
ln -s ~/Dropbox/repositories/git/conkeror-saner-defaults/.conkerorrc ~/
