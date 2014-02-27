#!/bin/bash
# Use: $0 {start|stop|restart|status}
# Generic Service Wrapper
# Example:
# $0 <htop|nm-applet|some-personal-script> {start|stop|status|restart}

### functions

# Application that this service wraps
APP=$1
shift

# Send a signal to the nm-applet pid (KILL to kill, 0 to know if it's alive)
app-send() {
    SIG=$1
    mypid=$(pidof $APP)
    [ -z "$mypid" ] && exit 1   # no pid so not running
    kill -$SIG $mypid && exit 0 # if pid exists and the process exists, will return 0
    exit 1 # otherwise problem
}

# Stop application
app-stop() {
    $(app-send KILL)
}

# Start application
app-start() {
    $APP
}

# status
app-status() {
    $(app-send 0)
    ( [ $? = 0 ] && echo "$APP is running!" ) || echo "$APP is not running!"
}

### run

case "$1" in
    start)
        app-start
        app-status
        ;;

    stop)
        app-stop
        app-status
        ;;

    restart)
        app-stop
        app-start
        ;;

    status)
        app-status
        ;;

    *)
	echo "Usage: $0 <APP> {start|stop|restart|status}" >&2
	exit 1
	;;
esac
