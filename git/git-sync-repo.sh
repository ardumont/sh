#!/usr/bin/env bash

# Use
# $0 /path/to/repo/git
# Will sync

cd $1/..
git fetch --all --recurse-submodules --prune
