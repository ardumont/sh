#!/usr/bin/env bash -xe

# Use
# $0 /path/to/repo-which-contains-the-project.clj-file
# Will sync the deps of the repo

[ -f $1 ] && cd $(dirname $1) || exit 0

lein deps
