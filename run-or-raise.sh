#!/bin/bash
# emulate stumpwms run-or-raise with ratpoison
# Param1: Windowname to look for
# Param2: Command to start if not present yet

#source: http://lists.gnu.org/archive/html/ratpoison-devel/2010-08/msg00005.html

ratpoison -c windows|grep -q $1

if [ $? -eq 0 ] ; then
#    echo "Value grep: $? . selecting"
    ratpoison -c "select $1"
else
#    echo "Value grep: $? . starting"
    $2&
fi
