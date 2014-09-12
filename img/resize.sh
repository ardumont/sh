#!/usr/bin/env bash
# depend on imagemagick

[ $# -ne 2 ] && echo "Use: $0 <EXT> <SIZE>
Resize the files with extension <EXT> to the size <SIZE>." && exit 1

EXT=$1
SIZE=$2

mogrify -resize $SIZE $EXT
