#!/bin/bash

[ $# -ne 1 ] && echo "Use: $0 <CMD>
CMD Command to execute for each commit since your repository's dawn of time" && exit 1

CMD="'$1'"

echo "!!!"
echo "You are about to rewrite your git history to globally execute a command $CMD."
echo "!!!"
read -p "Type anything to confirm you know what you are doing or <CTRL-C> to abort."

GIT_CMD="git filter-branch --tree-filter $CMD HEAD"

eval $GIT_CMD
