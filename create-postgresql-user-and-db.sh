#!/bin/bash
# must be launched by the user postgres

[ -z $1 -o -z $2 ] && echo "Use: create-postgresql-user-and-db.sh <username> <dbname>" && exit 1;

USERNAME=$1
DBNAME=$2

echo "createuser -D -A -P $USERNAME"
createuser -D -A -P $USERNAME

echo "createdb -O $USERNAME $DBNAME"
createdb -O $USERNAME $DBNAME
