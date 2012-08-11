#!/bin/bash -x

# Use: a simple script to help in backup rapidly some heavy app (eclipse for one example)

COMMIT_MSG=$1
[ -z "$COMMIT_MSG" ] && COMMIT_MSG="stable"

git add .
git ls-files -d | xargs git rm
git commit -am $COMMIT_MSG
