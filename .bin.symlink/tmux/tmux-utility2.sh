#!/bin/sh

SESSION=bvanhai2
echo "starting $SESSION tmux session"

tmux has-session -t $SESSION

if [ $? != 0 ]; then
    # Create new session
    tmux new-session -d -s $SESSION -n 'ranger' "cd /home && ranger"

    # Create window#2
    tmux new-window -t $SESSION: -n 'misc'
    tmux split-window -h -p 32 -t $SESSION      # horizontal split
    tmux send-keys -t $SESSION 'ncmpcpp' C-m   # process in pane#2
    tmux split-window -v -p 58 -t $SESSION      # vertical split
    tmux send-keys -t $SESSION 'htop' C-m       # process in pane#3
    tmux split-window -v -p 74 -t $SESSION      # vertical split
    tmux send-keys -t $SESSION 'tmux-info.sh && sleep infinity' C-m
                                                # process in pane#4
    tmux select-pane -t $SESSION:2.1            # select pane#1 of window#2
    tmux split-window -v -p 32 -t $SESSION      # vertical split
    tmux select-pane -t $SESSION:2.1            # select pane#1 of window#2

    # Create window#3
    tmux new-window -t $SESSION: -n 'miscx'
    tmux split-window -h -p 50 -t $SESSION      # horizontal split
    tmux split-window -v -p 45 -t $SESSION      # vertical split
    tmux select-pane -t $SESSION:3.1            # select pane#1 of window#3
    tmux split-window -v -p 45 -t $SESSION      # vertical split
    tmux select-pane -t $SESSION:3.1            # select pane#1 of window#3

    # Create window#4
    tmux new-window -t $SESSION: -n 'nvim'
    tmux send-keys -t $SESSION 'nvim' C-m       # process in window#4

    # Go to window#2
    tmux select-window -t $SESSION:2            # select window#2
fi

tmux attach-session -d -t $SESSION
