#!/bin/bash

SRC=$HOME/Dropbox/repositories/git

. standard-functions.sh

# ~/bin
destroy-link ~/bin
ln -s $SRC/slash-my-home-slash-bin ~/bin

# ~/org
destroy-link ~/org
ln -s $SRC/my-org-files ~/org

# ~/.stumpwmrc
destroy-link ~/.stumpwmrc
ln -s $SRC/stumpw-config/.stumpwmrc ~

# ~/.bash*
destroy-link ~/.bashrc
destroy-link ~/.bashrc-work
destroy-link ~/.bash_aliases
destroy-link ~/.profile
destroy-link ~/.bash_history
destroy-link ~/.bash_prompt

ln -s $SRC/slash-my-home-slash-bin/.bashrc ~/
ln -s $SRC/slash-my-home-slash-bin/.bashrc-work ~/
ln -s $SRC/slash-my-home-slash-bin/.profile ~/
ln -s $SRC/slash-my-home-slash-bin/.bash_aliases ~/
ln -s $SRC/slash-my-home-slash-bin/.bash_prompt ~/
# not synchronized on github
ln -s ~/Dropbox/.bash_history ~/

# git-bash-completion
destroy-link ~/.git-completion.bash
ln -s $SRC/slash-my-home-slash-bin/.git-completion.bash ~/

# For conkeror
destroy-link ~/.conkerorrc
ln -s $SRC/conkeror-saner-defaults/.conkerorrc ~/

# link to some reading
destroy-link ~/lecture
ln -s ~/Dropbox/Documents/lecture ~

# link to my perso repositories
destroy-link ~/repositories/perso
ln -s ~/Dropbox/repositories/git/ ~/repositories/perso
