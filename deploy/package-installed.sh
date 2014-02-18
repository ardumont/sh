#!/bin/bash

# Script to determine if a package is installed or not

if [ $# -ne 1 ]; then
    cat <<EOF
Check if a package is installed or not.
Returns:
- DOES-NOT-EXIST if the package provided as argument does not exist.
- INSTALLED if the package is installed
- NOT if the package exist but is not installed.

Use: $0 <PACKAGE>
- PACKAGE Name of the package to check for installation.
EOF
    exit 1
fi

PACKAGE=$1

STATE=$(aptitude show $PACKAGE 2>/dev/null | grep 'State:' | cut -d':' -f2)

if [ "$STATE" = "" ]; then
    echo "DOES-NOT-EXIST"
elif [ "$STATE" = " installed" ]; then
    echo "INSTALLED"
else
    echo "NOT"
fi
