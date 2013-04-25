#!/bin/bash

IFS=''
for author in $(git log --all --format="%an" | sort -u)
do
  git log --author="$author" --pretty=tformat: --numstat | \
  grep -v node_modules |  \
  awk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END \
  { printf "%s +++ / %s --- / %s ++- \n",add,subs,loc }' -
done
