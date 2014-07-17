#!/usr/bin/env bash

git fetch --all

git checkout master
git reset --hard upstream/master

git checkout tony-br
git reset --hard tony

git checkout tony
git rebase upstream/master
