#!/bin/bash

killall -q polybar

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m POLYBAR_WIDTH=500 polybar --reload bar-bspwm 2>&1 | tee -a /tmp/polybar.log & disown
    done
else
    polybar --reload bar-bspwm 2>&1 | tee -a /tmp/polybar.log & disown
fi
