#!/bin/bash

#PROG=xfce4-panel
PROG="stalonetray -t --window-type=normal"

killall $PROG
$PROG &
