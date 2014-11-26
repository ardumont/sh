#!/usr/bin/env bash

# Deploy script to mobile

adb push tethering-mobile.sh /mnt/sdcard/

adb shell su - chmod +x /mnt/sdcard/tethering-mobile.sh
