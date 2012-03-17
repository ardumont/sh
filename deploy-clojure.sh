#!/bin/bash -x

. $(dirname $0)/standard-functions.sh

# Install clojure
yes | sudo aptitude install clojure inotify-tools ruby leiningen

# Install tools
$(dirname $0)/deploy-tools-clojure.sh
