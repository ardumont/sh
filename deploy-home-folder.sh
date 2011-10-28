#!/bin/bash

SRC=$HOME/Dropbox/repositories/git
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
do-action "ln -s $SRC/stumpw-config/.stumpwmrc $HOME/"

# $HOME/.bash*
destroy-link $HOME/.bashrc
destroy-link $HOME/.bashrc-work
destroy-link $HOME/.bash_aliases
destroy-link $HOME/.profile
destroy-link $HOME/.bash_history
destroy-link $HOME/.bash-prompt

do-action "ln -s $REPOSITORY/.bashrc $HOME/"
do-action "ln -s $REPOSITORY/.bashrc-work $HOME/"
do-action "ln -s $REPOSITORY/.profile $HOME/"
do-action "ln -s $REPOSITORY/.bash_aliases $HOME/"
do-action "ln -s $REPOSITORY/.bash-prompt $HOME/"
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

# link to my perso repositories
destroy-link $HOME/repositories/perso
do-action "ln -s $SRC $HOME/repositories/perso"
