#!/bin/sh

SESSION=bvanhai1
echo 'starting $SESSION tmux session'

tmux has -t $SESSION

if [ $? != 0 ]; then
    # Create new session
    tmux new -d -s $SESSION
fi

tmux attach -d -t $SESSION
