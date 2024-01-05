#!/usr/bin/env bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar -q main -c $HOME/.config/polybar/config.ini  &
done
