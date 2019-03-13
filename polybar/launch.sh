#!/usr/bin/sh

# Terminate already running bar instances
killall -q polybar

if ! xrandr | grep 'HDMI1 connected'; then
    MONITOR=eDP1 polybar pri &
else
    MONITOR=HDMI1 polybar pri &
    MONITOR=eDP1 polybar sec &
fi

