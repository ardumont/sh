#!/usr/bin/env bash -e

# Input the user we want to see
USER=$1
[ -z $USER ] && USER=ardumont

# Generate a temp file.
TMP_FILE=$(mktemp)

#Retrieve the informations around the user we want
curl http://www.4clojure.com/user/$USER 2>/dev/null > $TMP_FILE

# Check that there is no problem
CHECK_USER=$(cat $TMP_FILE | grep "User: \w*" -o | head -1 | cut -d' ' -f2)

[ $CHECK_USER != $USER ] && echo "There may be a problem with your input, the user '$USER' may not exist."

# Retrieve the score of this user
RES=$(cat $TMP_FILE | grep -o ">[0-9]*/[0-9]*<" | sed s/[\<\>]//g)

echo "4clojure.com status - $USER - $RES".
