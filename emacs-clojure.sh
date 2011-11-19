#!/bin/bash -xe

NW=$1

cd $(dirname $0)
emacs -fs $NW -e clojure-jack-in

