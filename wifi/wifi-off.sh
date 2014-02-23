#!/bin/bash -x
# shutdown wifi

WDIR=$(dirname $0)

$WDIR/wifi.sh off
