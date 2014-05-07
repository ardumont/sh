##!/bin/sh

FILE=$1

[ $# -ne 1 ] && echo "Use: $0 <FILE-TO-SYMMETRICALLY-DECRYPT>" && exit 1

gpg2 --decrypt $FILE
