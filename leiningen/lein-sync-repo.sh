#!/usr/bin/env bash

# Use
# $0 <path-to-repo>
# Will sync the deps of the repo

[ -f $1 ] && cd $(dirname $1) || exit 0

lein deps
