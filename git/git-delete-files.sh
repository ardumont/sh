#!/bin/bash -x

[ ! -d .git ] && echo "Error: must run this script from the root of a git repository" && exit 1

[ $# -eq 0 ] && echo "Use: $0 <FILE-0> <FILE-1> ... <FILE-N>
FILE-N Filepath to remove from history" && exit 1

# remove all paths passed as arguments from the history of the repo
FILES=$@

git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch $FILES" HEAD

# remove the temporary history git-filter-branch otherwise leaves behind for a long time
rm -rf .git/refs/original/ && git reflog expire --all && git gc --aggressive --prune
