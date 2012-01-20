#!/bin/bash -xe

NW=$1

# start emacs
emacs -fs $NW -e 'clojure-jack-in' -e 'split-window-vertically' -e 'other-window'

