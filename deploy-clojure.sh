#!/bin/bash -x

. $(dirname $0)/standard-functions.sh

# Install clojure
yes | sudo aptitude install clojure inotify-tools ruby leiningen

# install the plugin to make a server swank
do-action "lein plugin install swank-clojure 1.3.3"
do-action "lein plugin install lein-midje 1.0.7"
do-action "lein plugin install lein-marginalia 0.6.1"
do-action "lein plugin install lein-noir 1.2.1"
