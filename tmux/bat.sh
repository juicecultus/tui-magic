#!/bin/sh
if [ -f /sys/class/power_supply/BAT0/capacity ]; then
    cap=$(cat /sys/class/power_supply/BAT0/capacity)
    status=$(cat /sys/class/power_supply/BAT0/status)
    case "$status" in
        Charging)    icon="+" ;;
        Discharging) icon="-" ;;
        *)           icon="=" ;;
    esac
    echo "BAT:${icon}${cap}%"
else
    echo "AC"
fi
