#!/bin/bash -xe

# Use
# $0 /path/to/repo/git
# Will sync (git fetch --all)

cd $1/..
git fetch --all
