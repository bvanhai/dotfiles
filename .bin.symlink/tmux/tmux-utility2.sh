#!/bin/sh

SESSION=tmux2
echo "starting $SESSION tmux session"

tmux has -t $SESSION

if [ $? != 0 ]; then
    # Create new session, window#1
    tmux new -d -x 198 -y 51 -s $SESSION -n 'ranger' 'ranger ~/dev/mylinux'

    # Create window#2
    tmux neww -t $SESSION: -n 'misc'
    tmux splitw -h -p 32 -t $SESSION               # horizontal split
    tmux send -t $SESSION 'ncmpcpp -s clock' C-m   # process in pane#2
    tmux splitw -v -p 56 -t $SESSION               # vertical split
    tmux send -t $SESSION 'htop' C-m               # process in pane#3
    tmux splitw -v -p 76 -t $SESSION               # vertical split
    tmux send -t $SESSION 'clear' C-m              # clear screen
    tmux send -t $SESSION 'tmux-info.sh && sleep infinity' C-m
                                                   # process in pane#4

    tmux selectp -t $SESSION:2.1                   # select pane#1 of window#2
    tmux splitw -v -p 32 -t $SESSION               # vertical split
    tmux send -t $SESSION 'clear' C-m              # clear screen
    tmux selectp -t $SESSION:2.1                   # select pane#1 of window#2

    # Create window#3
    tmux neww -t $SESSION: -n 'miscx'
    tmux splitw -h -p 50 -t $SESSION               # horizontal split
    tmux splitw -v -p 45 -t $SESSION               # vertical split
    tmux selectp -t $SESSION:3.1                   # select pane#1 of window#3
    tmux splitw -v -p 45 -t $SESSION               # vertical split
    tmux selectp -t $SESSION:3.1                   # select pane#1 of window#3

    # Create window#4
    tmux neww -t $SESSION: -n 'nvim'
    tmux send -t $SESSION 'nvim' C-m               # process in window#4

    # Go to window#2
    tmux selectw -t $SESSION:2                     # select window#2
    tmux send -t $SESSION 'clear' C-m              # clear screen
fi

tmux attach -d -t $SESSION
