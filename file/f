#!/bin/bash -xe

REGEXP="*"$(echo "$*" | sed 's/[ ]/*/g')"*"

find . -iname "$REGEXP"
