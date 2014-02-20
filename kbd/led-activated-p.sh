#!/bin/bash
# Use: $0
# send the number corresponding to led activated or not
# 0 no one is activated
# 1 caps lock
# 2 num lock
# 3 num lock and caps lock

xset q | grep "LED mask" | sed -r "s/.*LED mask:\s+[0-9a-fA-F]+([0-9a-fA-F]).*/\1/"
