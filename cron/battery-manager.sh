#!/bin/sh

# source: https://github.com/massyl/dotFiles/blob/master/batteryManager.sh

battery_charging=`acpi -b | awk '{print $3}'|awk -F"," '{print $1}'`
battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`

export DISPLAY=:0

[ $battery_level -eq 20  -o $battery_level -le 10 ] && [ $battery_charging = "Discharging" ] && notify-send "Battery low: ${battery_level}%!"
