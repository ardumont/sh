#!/bin/sh -x

# Use: $0
# This script will:
# - Activate palm detection
# - Activate tap to click
# - Activate 2 fingers tapping as right click
# - Activate 3 fingers tapping as middle click

synclient PalmDetect=0 \
          TapButton1=1 \
          TapButton2=3 \
          TapButton3=2
