#!/usr/bin/env bash

PROJ_NAME=$1

CB=ssh://git@git.cloudbees.com/webadeo/
GH=git@github.com:webadeo/

# clone the repository
git clone $CB$PROJ_NAME.git
# go inside it
cd $PROJ_NAME
# remove the old reference
git remote rm origin
# add the new one
git remote add origin $GH$PROJ_NAME
# update the master branch
git push -u origin master
# add the old reference to update all the missing branches
git remote add oldorigin $CB$PROJ_NAME
# fetch all branches and tags
git fetch --all
# update all the branches and tags
for i in $(git branch -r | grep oldorigin | sed 's/oldorigin\/\(.*\)/\1/g' | grep -v HEAD); do git checkout $i && git push -u origin $i; git push --tags;  done

git remote rm oldorigin
