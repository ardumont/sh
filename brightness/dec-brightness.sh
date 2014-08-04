#!/usr/bin/env bash

# Use: $0 <brightness increment>
# Decrement the current brightness by the brightness increment passed as parameter

INC=${1:-"2"}

xbacklight -dec $INC
