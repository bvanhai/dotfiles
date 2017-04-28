#!/bin/sh

SESSION=bvanhai
echo "starting $SESSION tmux session"

tmux has-session -t $SESSION

if [ $? != 0 ]; then
    # Create new session, name it, name the window, detach
    tmux new-session -d -s $SESSION -n ranger "cd /home && ranger"

    tmux new-window -t $SESSION: -n misc
    tmux split-window -h -p 32 -t $SESSION      # horizontal split
    tmux select-pane -t $SESSION:2.2            # select second pane
    tmux send-keys -t $SESSION 'music.sh' C-m   # process in second pane
    tmux split-window -v -p 56 -t $SESSION      # create a pane below second pane
    tmux send-keys -t $SESSION 'htop' C-m       # process in third pane
    tmux split-window -v -p 75 -t $SESSION      # create a pane below third pane
    tmux send-keys -t $SESSION 'tmux-utility-info.sh && sleep infinity' C-m     # process in fourth pane
    tmux select-pane -t $SESSION:2.1            # select first pane of window#2
    tmux split-window -v -p 32 -t $SESSION      # vertical split

    tmux new-window -t $SESSION 'nvim'

    # Go to first pane of window#2
    tmux select-window -t $SESSION:2    # select window#2
    tmux select-pane -t $SESSION:2.1    # select first pane of window#2
fi

tmux attach-session -d -t $SESSION
