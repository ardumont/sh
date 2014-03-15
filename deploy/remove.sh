#/bin/bash

WDIR=$(dirname $0)

# remove

sudo aptitude remove $*
