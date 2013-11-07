#!/bin/bash -e

[ $# -ne 1 ] && echo "Use: $0 <absolute-file-to-public-key>" && exit 1

xclip -sel clip < $1
