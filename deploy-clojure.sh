#!/bin/bash -xe

# Install clojure
aptitude install clojure

# deploy tools to help
[ ! -d ~/repositories ] && mkdir -p ~/repositories/clones
cd ~/repositories/clones

[ ! -d ~/repositories/clones/leiningen ] && git clone https://github.com/technomancy/leiningen.git

# will launch the download of all needed
cd leiningen
lein

# install the plugin to make a server swank
lein plugin install swank-clojure 1.3.1

# Install clojure mode in emacs
# M-x list-packages
# select clojure-mode I
# x to install
