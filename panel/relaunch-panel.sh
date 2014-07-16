#!/usr/bin/env bash

#PROG=xfce4-panel
PROG="stalonetray -t --window-type=normal"

~/bin/service/service.sh restart $PROG &
