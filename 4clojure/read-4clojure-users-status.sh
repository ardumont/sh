#!/usr/bin/env bash

# Given a file that contains the name of user, check their 4clojure status

# working directory
WDIR=$(dirname $(readlink -f $0))

# List of user to follow
LIST_USER_FILE=$1

# Fallback list
[ -z $LIST_USER_FILE ] && LIST_USER_FILE=~/bin/4clojure-people-i-follow.list

# Check that the user list file exist
[ ! -f $LIST_USER_FILE ] && echo "#### $LIST_USER_FILE does not exist. Please, input a correct file with one user per line." && exit 1

# Create a temp file
TMP_FILE=$(mktemp)

# Count the number of user to follow
LENGTH=$(wc -l $LIST_USER_FILE | cut -d' ' -f1)
echo "#### Retrieving data over network - $LENGTH people"

# Build the user status for each user
for user in $(cat $LIST_USER_FILE); do
    $WDIR/read-4clojure-user-status.sh $user >> $TMP_FILE
done

echo "#### Result:"
cat $TMP_FILE
