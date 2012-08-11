#!/bin/bash -x

# Use: a simple script to help in backup rapidly some heavy app (eclipse for one example)
# $0                 add in the git index all the modified and new files, add the deleted ones in the index too then commit with the
#                    phrase "stable"
# $0 "some-message"  the same as before but with the commit message 'some-message'

COMMIT_MSG=$1
[ -z "$COMMIT_MSG" ] && COMMIT_MSG="stable"

git add .
git ls-files -d | xargs git rm
git commit -am $COMMIT_MSG
