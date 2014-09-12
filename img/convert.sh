#!/usr/bin/env bash
# depend on imagemagick

[ $# -ne 2 ] && echo "Use: $0 <IMG> <NEW-EXTENSION>
Convert the specified image IMG to the same image in NEW-EXTENSION format." && exit 1

IMG=$1
TO=$2

convert $IMG ${IMG%.*}.$TO
