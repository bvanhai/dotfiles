#!/bin/sh

# Clock toggle
PID="$( pgrep dzen | xargs ps | grep dzen2-clock-not | awk '{print $1}' )"

if [[ $PID ]]; then
    kill $PID
else
    $HOME/.bin/panel/dzen2-clock-not &
fi
