#!/usr/bin/env bash

if [ $# -ne 2 ]; then
  echo "Use : $0 <database> <file>";
  exit 1;
fi

_set(){
  MYSQLDUMP=mysqldump
  USER=root
}

_unset(){
  unset MYSQLDUMP USER
}

_set

${MYSQLDUMP} -u ${USER} -p $1 > $2

_unset
