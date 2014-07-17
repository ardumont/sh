#!/usr/bin/env bash

for giturl in $(cat ~/bin/repo/git-repos.list); do
    git clone --recursive $giturl
done
