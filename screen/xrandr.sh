#!/bin/bash

# Use: reference some use case for xrandr

xrandr \
    --dryrun
    --output DP3 \
    --off \
    --output DP2 \
    --off \
    --output DP1 \
    --off \
    --output HDMI3 \
    --off \
    --output HDMI2 \
    --off \
    --output HDMI1 \
    --off \
    --output LVDS1 \
    --mode 1366x768 \
    --pos 0x768 \
    --rotate normal \
    --output VGA1 \
    --mode 1366x768 \
    --pos 0x0 \
    --rotate normal

xrandr \
    --dryrun  \
    --output VGA1 \
    --rotate normal \
    --mode 1920x1080 \
    --pos 0x0 \
    --output DP2 \
    --rotate normal \
    --pos 0x0
