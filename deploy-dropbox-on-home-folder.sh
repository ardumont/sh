#!/bin/bash

DROPBOX=~/Dropbox

# ~/bin
rm ~/bin
ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin ~/bin

# ~/org
rm ~/org
ln -s $DROPBOX/repositories/git/my-org-files ~/org

# ~/.stumpwmrc
rm ~/.stumpwmrc
ln -s $DROPBOX/repositories/git/stumpw-config/.stumpwmrc ~

# ~/.bash*
rm ~/.bashrc
rm ~/.bash_aliases
rm ~/.profile
rm ~/.bash_history

ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin/.bashrc ~/
ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin/.profile ~/
ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin/.bash_aliases ~/
# not synchronized on github
ln -s $DROPBOX/.bash_history ~/

# git-bash-completion
rm ~/.git-completion.bash
ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin/.git-completion.bash

# For emacs
~/mv ~/.emacs.d/ ~/.emacs.d.clean-install
ln -s ~/Dropbox/Documents/emacs.d ~/.emacs.d

# For conkeror
rm ~/.conkerorrc
ln -s ~/Dropbox/repositories/git/conkeror-saner-defaults/.conkerorrc ~/
