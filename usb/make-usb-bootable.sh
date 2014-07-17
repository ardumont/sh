#!/usr/bin/env bash
# Use:
# make a bootable disk

if [ $# -ne 2 ]; then
    echo "Use: $0 <ISO> <DEV>"
    exit 1
fi

ISO=$1
DEV=$2

sudo dd if=$1 of=$2 oflag=direct bs=1048576
