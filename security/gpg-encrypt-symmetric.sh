#!/bin/sh

FILE=$1
OUTPUT_FILE="$FILE.gpg"

[ $# -ne 1 ] && echo "Use: $0 <FILE-TO-SYMMETRICALLY-ENCRYPT>" && exit 1

gpg2 -o $OUTPUT_FILE --cipher-algo AES256 --symmetric $FILE
