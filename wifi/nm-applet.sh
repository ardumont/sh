#!/bin/bash
# Use: $0 {start|stop|restart|status}
# Service Wrapper around nm-applet

### functions

APP=nm-applet

# Send a signal to the nm-applet pid (KILL to kill, 0 to know if it's alive)
app-send() {
    SIG=$1
    mypid=$(pidof $APP)
    [ -z "$mypid" ] && exit 1   # no pid so not running
    kill -$SIG $mypid && exit 0 # if pid exists and the process exists, will return 0
    exit 1 # otherwise problem
}

# Stop nm-applet
app-stop() {
    app-send KILL
}

# Start nm-applet
app-start() {
    $APP
}

# status
app-status() {
    $(app-send 0)
    ( [ $? = 0 ] && echo "Running!" ) || echo "Not running"
}

### run

case "$1" in
    start)
        app-start
        ;;

    stop)
        app-stop
        ;;

    restart)
        app-stop
        app-start
        ;;

    status)
        app-status
        ;;

    *)
	echo "Usage: $0 {start|stop|restart|status}" >&2
	exit 1
	;;
esac
