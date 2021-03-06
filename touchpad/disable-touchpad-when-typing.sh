#!/usr/bin/env bash

# Use: $0
# Will trigger syndaemon if no existing instance exists

# -i 2: Idle time set to 2 seconds
# -k:   Ignore modifier keys when monitoring keyboard activity
# -t:   Only disable tapping and scrolling, not mouse movements, in response to keyboard activity.

# Checkk if syndaemon present, if not, we exit immediately
which syndaemon 2>&1 >/dev/null || return 0

SYN_PID=$(pgrep syndaemon)

[ -z "$SYN_PID" ] && syndaemon -t -k -i 2 &
