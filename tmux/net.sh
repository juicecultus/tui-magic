#!/bin/bash
# Network status for tmux status bar
ETH=$(cat /sys/class/net/enp2s1/operstate 2>/dev/null)
WIFI=$(cat /sys/class/net/wlp2s2/operstate 2>/dev/null)

if [ "$ETH" = "up" ]; then
    E="E:✓"
else
    E="E:✗"
fi

if [ "$WIFI" = "up" ]; then
    SSID=$(nmcli -t -f active,ssid dev wifi 2>/dev/null | grep '^yes' | cut -d: -f2)
    W="W:${SSID:-on}"
else
    W="W:✗"
fi

echo "$E $W"
