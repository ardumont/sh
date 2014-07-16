#!/usr/bin/env bash -x

# Use:
# deploy new repository inside /etc/apt/sources.list
# Example:
# $0 deb http://cran.univ-paris1.fr/bin/linux/ubuntu quantal/
# $0 "deb [arch=amd64] http://www.recoil.org/~avsm/ wheezy main"

CONTENT="$*"
FILE=/etc/apt/sources.list

grep "$CONTENT" $FILE

if [ $? -ne 0 ]; then
    echo "$CONTENT" | sudo tee -a $FILE
    sudo aptitude update
fi
