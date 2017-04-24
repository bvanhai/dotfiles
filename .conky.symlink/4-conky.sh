#!/bin/bash

killall conky
sleep 2 && conky -d -c $HOME/.conky/4r &
sleep 5 && conky -d -c $HOME/.conky/4l &
