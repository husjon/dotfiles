#!/usr/bin/env bash

cd /tmp

while pgrep polybar; do
    echo "[!] Waiting for polybar"
    pkill polybar
done


if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        echo "[!] Launching polybar on monitor: $m"
        MONITOR=$m polybar "$m" &
    done
else
    polybar top &
fi


if [ -f "$(dirname "$(realpath "$0")")/toggle" ]; then
    notify-send "polybar" "toggle"
    sleep 1 && polybar-msg cmd toggle
fi
