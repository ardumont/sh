#!/usr/bin/env bash

# Use: $0 <brightness increment>
# Increment the current brightness by the increment passed as parameter (default 2)

INC=${1:-2}

xbacklight -inc $INC
