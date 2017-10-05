#!/bin/sh

SESSION=bvanhai1
echo "starting $SESSION tmux session"

tmux has-session -t $SESSION

if [ $? != 0 ]; then
    # Create new session
    tmux new-session -d -s $SESSION
fi

tmux attach-session -d -t $SESSION
