#!/bin/bash


if [[ "$HOSTNAME" == "workstation" ]]; then
    RES=2560x1440
    RATE=${1:-120}
    DPI=96

    xrandr --output DP-4 --auto
    xrandr --output DP-2 --right-of DP-4 --auto

    xrandr --output DP-4 --mode $RES --rate "$RATE" --primary --auto
    xrandr --output DP-2 --mode $RES --rate "$RATE" --right-of DP-4 --auto

    for monitor in $(xrandr | awk '/ connected.*panning/ {print $1}'); do
        xrandr --output "$monitor" --mode $RES --panning $RES --auto
        sleep 0.5
    done

    xrandr --output DP-2 --right-of DP-4
    xrandr --dpi $DPI

elif [[ "$HOSTNAME" == "laptop" ]]; then
    xrandr --output eDP1 --mode 2160x1440 --rate 60
    xrandr --output --primary
fi
