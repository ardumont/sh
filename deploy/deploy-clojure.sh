#!/usr/bin/env bash -x

WDIR=$(dirname $0)

$WDIR/install.sh clojure inotify-tools ruby

$WDIR/deploy-tools-clojure2.sh
