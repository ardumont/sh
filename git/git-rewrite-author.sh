#!/usr/bin/env bash

[ ! -d .git ] && echo "Error: must run this script from the root of a git repository" && exit 1

[ $# -ne 1 -a $# -ne 2 ] && echo "Use: $0 <AUTHOR> (<AUTHOR_NAME>)
AUTHOR_EMAIL Author's email
AUTHOR_NAME  (Optional) Author's name" && exit 1

AUTHOR_EMAIL=$1
AUTHOR_NAME=${2-"Antoine R. Dumont"}

echo "!!!"
echo "You are about to rewrite your git history to globally update your email address in your commit message."
echo "!!!"
read -p "Type anything to confirm you know what you are doing or <CTRL-C> to abort."

FILTER_COMMAND='if [ "$GIT_AUTHOR_EMAIL" = "'$AUTHOR_EMAIL'" ];
        then
                GIT_AUTHOR_NAME="'$AUTHOR_NAME'";
                GIT_AUTHOR_EMAIL="'$AUTHOR_EMAIL'";
                git commit-tree "$@";
        else
                git commit-tree "$@";
        fi'

GIT_CMD="git filter-branch --commit-filter '$FILTER_COMMAND' HEAD"

eval $GIT_CMD
