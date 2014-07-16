#!bash

if [ $# -ne 1 ]; then
    echo "Use: $0 <BRANCH_NAME>"
    echo "  <BRANCH_NAME> Branch to delete locally and remotely from the origin remote"
    exit 1
fi

BRANCH_NAME=${1}

echo "Branch to delete: " $BRANCH_NAME

git branch -d $BRANCH_NAME

[ $? != 0 ] && echo "Branch not merged. Really destroy it? (Hit C-c to stop)." && read && git branch -D $BRANCH_NAME

git push origin :$BRANCH_NAME
