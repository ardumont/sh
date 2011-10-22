#!/bin/bash

# Working directory of the script
WDIR=$(dirname $0)

# backup the original file
mv $HOME/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml $HOME/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml.original
# make a link to the gconf configuration file from the terminal
ln -s $HOME/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml $WDIR/%gconf.xml
