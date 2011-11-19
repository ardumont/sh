#!/bin/bash -xe

NW=$1

emacs -fs $NW -e clojure-jack-in

