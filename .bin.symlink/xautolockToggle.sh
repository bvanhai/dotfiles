#! /bin/sh

STATEFILE=/tmp/xautolock.state
STATE=`cat $STATEFILE`

if [[ $STATE = "disabled" ]]; then
    echo "enabled" > $STATEFILE
    PID="$( pgrep dzen | xargs ps | grep dzen2-xautolock-not | awk '{print $1}' )"
        if [[ $PID ]]; then
        kill $PID
    fi
fi

if [[ $STATE = "enabled" ]]; then
    echo "disabled" > $STATEFILE
    $HOME/.bin/panel/dzen2-xautolock-not &
fi
