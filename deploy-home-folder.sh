#!/bin/bash

SRC=$HOME/repositories/perso
REPO_BIN=$SRC/sh/
REPO_TEAM=$SRC/common-sh/

echo ". $(dirname $0)/standard-functions.sh"
. $(dirname $0)/standard-functions.sh

# $HOME/bin
destroy-link $HOME/bin
do-action "ln -s $REPO_BIN $HOME/bin"

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
destroy-link $HOME/.bashrc-prompt
destroy-link $HOME/.bashrc-work

do-action "ln -s $REPO_BIN/.profile $HOME/"
do-action "ln -s $REPO_BIN/.bashrc $HOME/"
do-action "ln -s $REPO_BIN/.bashrc-env $HOME/"
do-action "ln -s $REPO_BIN/.bashrc-path $HOME/"
do-action "ln -s $REPO_BIN/.bash_aliases $HOME/"
do-action "ln -s $REPO_BIN/.bashrc-prompt $HOME/"
do-action "ln -s $REPO_BIN/.bashrc-work $HOME/"
do-action "ln -s $REPO_TEAM ~/team/bin"

# git-bash-completion
destroy-link $HOME/.git-completion.bash
do-action "ln -s $HOME/bin/.git-completion.bash $HOME/"

# For conkeror
destroy-link $HOME/.conkerorrc
do-action "ln -s $SRC/conkeror-saner-defaults/.conkerorrc $HOME/"

# link to some reading
destroy-link $HOME/lecture
do-action "ln -s $HOME/Dropbox/Documents/lecture $HOME/"

# create the usefull arborescence
mkdir -p ~/team/
mkdir -p ~/work/
