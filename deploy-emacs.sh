#!/bin/bash

. standard-functions.sh

# Install git and emacs
echo "sudo apt-get install git emacs"
sudo aptitude install git emacs

# Delete the old link 
[ -h $HOME/.emacs.d ] && do-action "rm $HOME/.emacs.d"
# or default directory for emacs
[ -d $HOME/.emacs.d ] && do-action "mv $HOME/.emacs.d $HOME/.emacs.d.clean-install"

# Then clone the repository of the emacs-starter-kit
# https://github.com/technomancy/emacs-starter-kit

do-action "git clone https://github.com/technomancy/emacs-starter-kit.git $HOME/.emacs.d"

# create a link to my specific setup
[ -h $HOME/.emacs.d/tony.el ] && do-action "rm $HOME/.emacs.d/tony.el"
do-action "ln -s $HOME/Dropbox/repositories/git/slash-my-home-slash-bin/tony.el $HOME/.emacs.d/tony.el"

[ -h $HOME/.emacs.d/linum.el ] && do-action "rm $HOME/.emacs.d/linum.el"
do-action "wget http://web.student.tuwien.ac.at/$HOMEe0225855/linum/linum.el --output-document $HOME/Dropbox/repositories/git/slash-my-home-slash-bin/linum.el"
do-action "ln -s $HOME/Dropbox/repositories/git/slash-my-home-slash-bin/linum.el $HOME/.emacs.d/linum.el"

