#!/bin/bash -xe

NW=$1

emacsclient -t -fs $NW -e clojure-jack-in

