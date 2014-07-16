#!/usr/bin/env bash
# Use: $0 {start|stop|restart|status} <APP>
# Generic Service Wrapper
# Example:
# $0 {start|stop|status|restart} <htop|nm-applet|some-personal-script>

### functions

# Application that this service wraps
ACTION=$1
APP=$2
shift
shift
CMD="$APP $*"

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
    $CMD
}

# status
app-status() {
    $(app-send 0)
    ( [ $? = 0 ] && echo "$APP is running!" ) || echo "$APP is not running!"
}

### run

case "$ACTION" in
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
        echo "Usage: $0 {start|stop|restart|status} <APP>" >&2
        exit 1
        ;;
esac
