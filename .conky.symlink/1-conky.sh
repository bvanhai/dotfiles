#!/bin/bash

killall conky
sleep 1 &&conky -d -c $HOME/.conky/1lt &
sleep 2 &&conky -d -c $HOME/.conky/1lb &
sleep 3 &&conky -d -c $HOME/.conky/1cb &
sleep 4 &&conky -d -c $HOME/.conky/1r &
