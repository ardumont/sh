#!/bin/bash

SRC=$HOME/repositories/perso
REPOSITORY=$SRC/slash-my-home-slash-bin

echo ". $(dirname $0)/standard-functions.sh"
. $(dirname $0)/standard-functions.sh

# $HOME/bin
destroy-link $HOME/bin
do-action "ln -s $REPOSITORY $HOME/bin"
ln -s $REPOSITORY $HOME/bin

# $HOME/org
destroy-link $HOME/org
do-action "ln -s $SRC/my-org-files $HOME/org"

# $HOME/.stumpwmrc
destroy-link $HOME/.stumpwmrc
do-action "ln -s $SRC/stumpwm-config/.stumpwmrc $HOME/"

# $HOME/.bash*
destroy-link $HOME/.profile
destroy-link $HOME/.bashrc
destroy-link $HOME/.bashrc-path
destroy-link $HOME/.bashrc-env
destroy-link $HOME/.bash_aliases
destroy-link $HOME/.bash_history
destroy-link $HOME/.bash-prompt
destroy-link $HOME/.bashrc-work

do-action "ln -s $REPOSITORY/.profile $HOME/"
do-action "ln -s $REPOSITORY/.bashrc $HOME/"
do-action "ln -s $REPOSITORY/.bashrc-env $HOME/"
do-action "ln -s $REPOSITORY/.bashrc-path $HOME/"
do-action "ln -s $REPOSITORY/.bash_aliases $HOME/"
do-action "ln -s $REPOSITORY/.bashrc-prompt $HOME/"
do-action "ln -s $REPOSITORY/.bashrc-work $HOME/"
# not synchronized on github
do-action "ln -s $HOME/Dropbox/.bash_history $HOME/"

# git-bash-completion
destroy-link $HOME/.git-completion.bash
do-action "ln -s $HOME/bin/.git-completion.bash $HOME/"

# For conkeror
destroy-link $HOME/.conkerorrc
do-action "ln -s $SRC/conkeror-saner-defaults/.conkerorrc $HOME/"

# link to some reading
destroy-link $HOME/lecture
do-action "ln -s $HOME/Dropbox/Documents/lecture $HOME/"

