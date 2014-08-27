#!/usr/bin/env bash

rm -rf ~/emacs-clean && mkdir ~/emacs-clean

cd ~/emacs-clean

emacs -Q -nw -l ~/bin/emacs/emacs-clean.el
