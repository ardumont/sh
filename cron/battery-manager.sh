#!/bin/sh -x

battery_charging=`acpi -b | awk '{print $3}'|awk -F"," '{print $1}'`
battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`

export DISPLAY=:0

[ $battery_level -le 20 ] && [ $battery_charging = "Discharging" ] && notify-send "Battery low : ${battery_level}%!"
