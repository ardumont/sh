#!/bin/bash -xe

OPTS=$@

# start emacs
emacs $OPTS -e 'clojure-jack-in' -e 'split-window-vertically' -e 'other-window' -e 'shell'

