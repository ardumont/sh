#!/bin/bash -x

. $(dirname $0)/standard-functions.sh

CMD="aptitude install clojure inotify-tools ruby"

if [ -f /etc/lsb-release ]; then #ubuntu
    # Install clojure
    yes | sudo $CMD
elif [ -f /etc/debian_version ]; then # debian
    su -c "$CMD"
fi

# Install tools
$(dirname $0)/deploy-tools-clojure.sh
