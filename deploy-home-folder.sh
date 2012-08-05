#!/bin/bash

SRC=$HOME/repositories/perso
REPO_BIN=$SRC/sh/
REPO_WORK=$SRC/work/bin
REPO_TEAM=$SRC/common-sh/
REPO_DOTFILES=$SRC/dot-files

mkdir -p $SRC

echo ". $(dirname $0)/standard-functions.sh"
. $(dirname $0)/standard-functions.sh

[ ! -d $REPO_DOTFILES ] && git clone git@github.com/ardumont/dot-files.git $HOME/repositories/perso/

# $HOME/bin
destroy-link $HOME/bin
do-action "ln -s $REPO_BIN $HOME/bin"

# $HOME/org
destroy-link $HOME/org
do-action "ln -s $SRC/my-org-files $HOME/org"

# $HOME/.stumpwmrc
destroy-link $HOME/.stumpwmrc
do-action "ln -s $REPO_DOTFILES/.stumpwmrc $HOME/"

# $HOME/.bash*
destroy-link $HOME/.profile
do-action "ln -s $REPO_DOTFILES/.profile $HOME/"

destroy-link $HOME/.bashrc
do-action "ln -s $REPO_DOTFILES/.bashrc $HOME/"

destroy-link $HOME/.bashrc-env
do-action "ln -s $REPO_DOTFILES/.bashrc-env $HOME/"

destroy-link $HOME/.bashrc-path
do-action "ln -s $REPO_DOTFILES/.bashrc-path $HOME/"

destroy-link $HOME/.bash_aliases
do-action "ln -s $REPO_DOTFILES/.bash_aliases $HOME/"

destroy-link $HOME/.bashrc-prompt
do-action "ln -s $REPO_DOTFILES/.bashrc-prompt $HOME/"

destroy-link $HOME/.tmux.conf
do-action "ln -s $REPO_DOTFILES/.tmux.conf $HOME/"

destroy-link $HOME/.ratpoisonrc
do-action "ln -s $REPO_DOTFILES/.ratpoisonrc $HOME/"

if [ -f $REPO_WORK/.bashrc-work ]; then
    destroy-link $HOME/.bashrc-work
    do-action "ln -s $REPO_WORK/.bashrc-work $HOME/"
fi

do-action "ln -s $REPO_TEAM ~/team/bin"

# git-bash-completion
destroy-link $HOME/.git-completion.bash
do-action "ln -s $REPO_DOTFILES/.git-completion.bash $HOME/"

# For conkeror
destroy-link $HOME/.conkerorrc
do-action "ln -s $REPO_DOTFILES/.conkerorrc $HOME/"

# link to some reading
destroy-link $HOME/lecture
do-action "ln -s $HOME/Dropbox/Documents/lecture $HOME/"

# create the usefull arborescence
mkdir -p ~/team/
mkdir -p ~/work/
