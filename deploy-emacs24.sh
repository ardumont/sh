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
do-action "sudo aptitude remove emacs emacs23"
do-action "sudo aptitude install git emacs-snapshot-gtk emacs-snapshot"

# Delete the old link
[ -d $HOME/.emacs.d ] && do-action "rm -rf $HOME/.emacs.d/*" || do-action "mkdir $HOME/.emacs.d"

do-action "cd $HOME/.emacs.d"

# create a link to my specific setup (init.el that loads the starterkit)
do-action "ln -s $REPOSITORY/init24.el $HOME/.emacs.d/init.el"

# add some mode not yet available with marmalade
[ -h $HOME/.emacs.d/linum.el ] && do-action "rm $HOME/.emacs.d/linum.el"
do-action "wget http://web.student.tuwien.ac.at/~e0225855/linum/linum.el --output-document $HOME/bin/linum.el"
do-action "ln -s $HOME/bin/linum.el $HOME/.emacs.d/linum.el"

