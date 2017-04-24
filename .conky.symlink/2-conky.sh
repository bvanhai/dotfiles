#!/bin/bash

killall conky
sleep 1 && conky -d -c $HOME/.conky/2lt &
sleep 2 && conky -d -c $HOME/.conky/2lb &
