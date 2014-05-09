#!/bin/bash

# Use: $0
# Will trigger syndaemon if no existing instance exists

# -i 2: Idle time set to 2 seconds
# -k:   Ignore modifier keys when monitoring keyboard activity
# -t:   Only disable tapping and scrolling, not mouse movements, in response to keyboard activity.

SYN_PID=$(pgrep syndaemon)

([ -z "$SYN_PID" ] && echo "Lauching syndaemon to disable touchpad when typing..." && syndaemon -t -k -i 2 &) || echo "Syndaemon already running..."
