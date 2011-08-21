#!/bin/bash

# Install git and emacs
echo "sudo apt-get install git emacs"
sudo apt-get install git emacs

# Delete the old link 
[ -h ~/.emacs.d ] && echo "rm ~/.emacs.d" && rm ~/.emacs.d
# or default directory for emacs
[ -d ~/.emacs.d ] && echo "mv ~/.emacs.d ~/.emacs.d.clean-install" && mv ~/.emacs.d ~/.emacs.d.clean-install

# Then clone the repository of the emacs-starter-kit
# https://github.com/technomancy/emacs-starter-kit

echo "git clone https://github.com/technomancy/emacs-starter-kit.git ~/.emacs.d"
git clone https://github.com/technomancy/emacs-starter-kit.git ~/.emacs.d
