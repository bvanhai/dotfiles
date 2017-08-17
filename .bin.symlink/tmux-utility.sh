#!/bin/sh

SESSION=bvanhai
echo "starting $SESSION tmux session"

tmux has-session -t $SESSION

if [ $? != 0 ]; then
    # Create new session, name it, name the window, detach
    tmux new-session -d -s $SESSION -n 'ranger' "cd /home && ranger"


    tmux new-window -t $SESSION: -n 'misc'
    tmux split-window -h -p 20 -t $SESSION      # horizontal split
    tmux send-keys -t $SESSION 'gtop' C-m       # process in pane#2
    tmux select-pane -t $SESSION:2.1            # select first pane of window#2
    tmux split-window -v -p 30 -t $SESSION      # create a pane below pane#1

    tmux new-window -t $SESSION 'nvim'


    tmux new-window -t $SESSION: -n 'miscx'
    tmux split-window -h -p 32 -t $SESSION      # horizontal split
    tmux select-pane -t $SESSION:4.2            # select pane#2
    tmux send-keys -t $SESSION 'music.sh' C-m   # process in pane#2
    tmux split-window -v -p 58 -t $SESSION      # create a pane below pane#2
    tmux send-keys -t $SESSION 'htop' C-m       # process in pane#3
    tmux split-window -v -p 74 -t $SESSION      # create a pane below pane#3
    tmux send-keys -t $SESSION 'tmux-utility-info.sh && sleep infinity' C-m     # process in pane#4
    tmux select-pane -t $SESSION:4.1            # select pane#1 of window#4
    tmux split-window -v -p 30 -t $SESSION      # vertical split
    tmux select-pane -t $SESSION:4.1            # select pane#1 of window#4

    # Go to first pane of window#2
    tmux select-window -t $SESSION:2    # select window#2
    tmux select-pane -t $SESSION:2.1    # select pane1#s of window#2
fi

tmux attach-session -d -t $SESSION
