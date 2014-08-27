#!/usr/bin/env bash

PACKAGE=$1

rm -rf ~/emacs-clean

bash ~/bin/emacs/emacs-install-clean.el $PACKAGE ~/emacs-clean/
