#!/bin/bash -e

. standard-functions.sh

# the directory where to store or find thingsx
REPOSITORY=$HOME/bin

# Add the key for the repository we need to add to install the new emacs
wget -q -O - http://emacs.naquadah.org/key.gpg | sudo apt-key add -

# Add the repositories

grep "emacs.naquadah.org" /etc/apt/sources.list || (sudo add-apt-repository "deb http://emacs.naquadah.org/ stable/" && sudo add-apt-repository "deb-src http://emacs.naquadah.org stable/")

# Update since the sources have been modified
do-action "sudo aptitude update"

# Install git and emacs
do-action "sudo aptitude remove emacs"
do-action "sudo aptitude install git emacs-snapshot-gtk"

# Delete the old link 
[ -h $HOME/.emacs.d ] && do-action "rm $HOME/.emacs.d"
# or default directory for emacs
[ -d $HOME/.emacs.d ] && do-action "mv $HOME/.emacs.d $HOME/.emacs.d.clean-install"

# Then clone the repository of the emacs-starter-kit
# https://github.com/technomancy/emacs-starter-kit
do-action "git clone https://github.com/technomancy/emacs-starter-kit.git $HOME/.emacs.d"
# at the moment, we are with the version 1 of the starter kit as we still depends on 
do-action "cd $HOME/.emacs.d" # twice else it does not work

# create a link to my specific setup
#[ -h $HOME/.emacs.d/tony.el ] && do-action "rm $HOME/.emacs.d/tony.el"
do-action "ln -s $REPOSITORY/tony.el $HOME/.emacs.d/tony.el"

# add some mode not yet available with marmalade
#[ -h $HOME/.emacs.d/linum.el ] && do-action "rm $HOME/.emacs.d/linum.el"
do-action "wget http://web.student.tuwien.ac.at/~e0225855/linum/linum.el --output-document $HOME/bin/linum.el"
do-action "ln -s $HOME/bin/linum.el $HOME/.emacs.d/linum.el"

