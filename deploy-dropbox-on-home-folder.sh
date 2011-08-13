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
ln -s $DROPBOX/repositories/git/stumpwm-config/.stumpwmrc ~/

# ~/.bash*
rm ~/.bashrc
rm ~/.bash_aliases
rm ~/.profile

ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin/.bashrc ~/
ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin/.profile ~/
ln -s $DROPBOX/repositories/git/slash-my-home-slash-bin/.bash_aliases ~/



