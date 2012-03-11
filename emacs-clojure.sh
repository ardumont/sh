#!/bin/bash -xe

OPTS=$@

# start emacs
emacs -fs $OPTS -e 'clojure-jack-in' -e 'split-window-vertically' -e 'other-window' -e 'multi-term'

