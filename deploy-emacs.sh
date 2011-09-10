#!/bin/bash

. standard-functions.sh

# Install git and emacs
echo "sudo apt-get install git emacs"
sudo apt-get install git emacs

# Delete the old link 
[ -h ~/.emacs.d ] && do-action "rm ~/.emacs.d"
# or default directory for emacs
[ -d ~/.emacs.d ] && do-action "mv ~/.emacs.d ~/.emacs.d.clean-install"

# Then clone the repository of the emacs-starter-kit
# https://github.com/technomancy/emacs-starter-kit

do-action "git clone https://github.com/technomancy/emacs-starter-kit.git ~/.emacs.d"

# create a link to my specific setup
[ -h ~/.emacs.d/tony.el ] && do-action "rm ~/.emacs.d/tony.el"
do-action "ln -s ~/Dropbox/repositories/git/slash-my-home-slash-bin/tony.el ~/.emacs.d/tony.el"
