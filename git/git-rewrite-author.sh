#!/bin/bash

[ $# -ne 1 ] && echo "Use: $0 <AUTHOR> (<AUTHOR_NAME>)
AUTHOR_EMAIL Author's email
AUTHOR_NAME  (Optional) Author's name" && exit 1

AUTHOR_EMAIL=$1
AUTHOR_NAME=${2-"Antoine R. Dumont"}

echo "!!!"
echo "You are about to rewrite your git history to globally update your email address in your commit message."
echo "!!!"
read -p "Type anything to confirm you know what you are doing or <CTRL-C> to abort."

git filter-branch --commit-filter '
        if [ "$GIT_AUTHOR_EMAIL" = "$AUTHOR" ];
        then
                GIT_AUTHOR_NAME="$AUTHOR_NAME";
                GIT_AUTHOR_EMAIL="$AUTHOR_EMAIL";
                git commit-tree "$@";
        else
                git commit-tree "$@";
        fi' HEAD
