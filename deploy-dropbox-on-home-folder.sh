#!/bin/bash

DROPBOX=~/Dropbox

# ~/bin
ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin ~/bin

# ~/org
ln -s $DROPBOX/repositories/git/my-org-mode ~/org

# ~/.stumpwmrc
ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin/.stumpwmrc ~/

# ~/.bash*
rm ~/.bashrc
rm ~/.bash_aliases
rm ~/.profile

ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin/.bashrc ~/
ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin/.profile ~/
ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin/.bash_aliases ~/



