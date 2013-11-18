#!/bin/bash -e

[ $# -ne 2 ] && echo "token.sh <USER> <PASS>" && exit 1

URL=http://marmalade-repo.org
USER=$1
PASS=$2

curl -XPOST "$URL/v1/users/login?name=$USER&password=$PASS"
