#!/bin/sh

SESSION=tmux1
echo "starting $SESSION tmux session"

tmux has -t $SESSION

if [ $? != 0 ]; then
    # Create new session, window#1
    tmux new -d -x 198 -y 51 -s $SESSION
fi

tmux attach -d -t $SESSION
