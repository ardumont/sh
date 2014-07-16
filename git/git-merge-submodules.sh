#!bash
# Use: $0
# Make the submodule progress to the origin/HEAD of their respective current branch

WDIR=$1
BRANCH=master
ROOT_DIR=$(pwd)

for d in *; do
    [ -d $d ] && cd $d && echo "module: $d" && git checkout $BRANCH && git reset --hard origin/$BRANCH
    cd $ROOT_DIR
done
