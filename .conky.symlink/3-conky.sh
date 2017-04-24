#!/bin/bash

killall conky
sleep 1 && conky -d -c $HOME/.conky/3l &
sleep 2 && conky -d -c $HOME/.conky/3r &
