#!/usr/bin/env bash

# Working directory of the script
WDIR=$(dirname $0)

FILE=$HOME/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml

[ -h $FILE ] && rm $FILE # delete the link
[ -f $FILE ] && mv $FILE $FILE.original # backup the original file

# make a link to the gconf configuration file from the terminal
ln -s $WDIR/%gconf.xml $FILE
