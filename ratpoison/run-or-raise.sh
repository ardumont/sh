#!bash
# emulate stumpwms run-or-raise with ratpoison
# $1: Windowname to look for
# $2: Command to start if the Windowname to look for is not found yet, if this is not provided, we use the Windowname

#source: http://lists.gnu.org/archive/html/ratpoison-devel/2010-08/msg00005.html

ratpoison -c windows|grep -iq $1

if [ $? -eq 0 ] ; then
#    echo "Value grep: $? . selecting"
    ratpoison -c "select $1"
else
#    echo "Value grep: $? . starting"
    if [ -z "$2" ]; then
        # fallback, we use the same command as the window
        $1&
    else
        $2&
    fi
fi
