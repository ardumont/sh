#!/bin/sh -x

# Pre-requisite:
# - install sqlplus and update PATH with sqlplus installation folder
# - update LD_LIBRARY_PATH with shared library folder needed by sqlplus
[ $# -ne 4 ] && echo "Use: $0 <USERNAME> <HOST> <PORT> <SSID>" && exit 1

USERNAME=$1
HOST=$2
PORT=$3
SSID=$4

sqlplus $USERNAME@"(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=$HOST)(PORT=$PORT))(CONNECT_DATA=(SID=$SSID)))"
