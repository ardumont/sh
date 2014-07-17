#!/usr/bin/env bash

[ $# -ne 1 ] && echo "Use: $0 <email-address>" && exit 1

ssh-keygen -t rsa -C $1
