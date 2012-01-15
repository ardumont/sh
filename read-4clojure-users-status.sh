#!/bin/bash -e

# Given a file that contains the name of user, check their 4clojure status

# where do we work
WDIR=$(dirname $(readlink -f $0))

# the list of user to check data
LIST_USER_FILE=$1
[ -z $LIST_USER_FILE ] && LIST_USER_FILE=4clojure-people-i-follow.list

# create a temp file
TMP_FILE=$(mktemp)

LENGTH=$(wc -l $LIST_USER_FILE | cut -d' ' -f1)
echo "#### Retrieving data over network - $LENGTH people"

# Build the user status for each user
for user in $(cat $LIST_USER_FILE); do
    $WDIR/read-4clojure-user-status.sh $user >> $TMP_FILE
done

echo "#### Result:"
cat $TMP_FILE
