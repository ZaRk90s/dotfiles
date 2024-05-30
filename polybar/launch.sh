#!/usr/bin/env sh

## Add this to your wm startup file.

# Termiate already running instance
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

# One bar
polybar example -c ~/.config/polybar/config.ini
