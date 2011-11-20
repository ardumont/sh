#!/bin/bash -e

. standard-functions.sh

# the directory where to store or find thingsx
REPOSITORY=$HOME/bin

# Install git and emacs
do-action "sudo aptitude install git emacs"

# Delete the old link 
[ -h $HOME/.emacs.d ] && do-action "rm $HOME/.emacs.d"
# or default directory for emacs
[ -d $HOME/.emacs.d ] && do-action "mv $HOME/.emacs.d $HOME/.emacs.d.clean-install"

# Then clone the repository of the emacs-starter-kit
# https://github.com/technomancy/emacs-starter-kit
do-action "git clone https://github.com/technomancy/emacs-starter-kit.git $HOME/.emacs.d"
# at the moment, we are with the version 1 of the starter kit as we still depends on 
# emacs 23 (version >= 2 depends on emacs 2 not yet in repositories)
do-action "cd $HOME/.emacs.d && git checkout master && git checkout master" # twice else it does not work

# create a link to my specific setup
[ -h $HOME/.emacs.d/tony.el ] && do-action "rm $HOME/.emacs.d/tony.el"
do-action "ln -s $REPOSITORY/tony.el $HOME/.emacs.d/tony.el"

# add some mode not yet available with marmalade
[ -h $HOME/.emacs.d/linum.el ] && do-action "rm $HOME/.emacs.d/linum.el"
do-action "wget http://web.student.tuwien.ac.at/~e0225855/linum/linum.el --output-document $HOME/bin/linum.el"
do-action "ln -s $HOME/bin/linum.el $HOME/.emacs.d/linum.el"

[ -h $HOME/.emacs ] && do-action "rm $HOME/.emacs"
do-action "ln -s $HOME/bin/.emacs $HOME/.emacs"

